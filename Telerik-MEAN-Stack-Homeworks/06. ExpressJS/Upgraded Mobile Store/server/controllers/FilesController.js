var encryption = require('../utilities/encryption'),
    uploading = require('../utilities/uploading'),
    files = require('../models/files');

var URL_PASSWORD = 'random secret';

var uploadedFiles = [];

function getDate() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1;

    var yyyy = today.getFullYear();
    if(dd < 10){
        dd='0'+dd
    }

    if(mm < 10){
        mm= '0'+mm
    }

    return dd + '-' + mm + '-' + yyyy;
}

module.exports = {
    getUpload : function(req, res, next) {
        res.render('../views/files/upload');
    },
    postUpload: function(req, res, next) {
        req.pipe(req.busboy);

        var username = req.user.username;

        req.busboy.on('file', function (fieldname, file, filename) {
            var fileNameHashed = encryption.generateHashedPassword(encryption.generateSalt(), filename);
            var currentDate = getDate();
            var path = '/' + username + '/' + currentDate + '/';
            var url = path + fileNameHashed;
            var urlEncrypted = encryption.encrypt(url, URL_PASSWORD);
            console.log(urlEncrypted);
            uploading.saveFile(file, path, fileNameHashed);

            uploadedFiles[username] = uploadedFiles[username] || [];

            uploadedFiles[username][fieldname] = uploadedFiles[username][fieldname] || {};
            var dbFile = uploadedFiles[username][fieldname];
            dbFile.url = urlEncrypted;
            dbFile.fileName = filename;
        });

        req.busboy.on('field', function(fieldname, val) {
            var index = fieldname.split('_')[1];
            uploadedFiles[username] = uploadedFiles[username] || [];
            uploadedFiles[username]['file_' + index] = uploadedFiles[username]['file_' + index] || {};
            var dbFile = uploadedFiles[username]['file_' + index];
            dbFile.isPrivate = !!val;
        });

        req.busboy.on('finish', function() {
            files.addFiles(uploadedFiles[username]);
            res.redirect('/upload-results');
        });
    },
    getResults: function(req, res, next) {
        var resultFiles = uploadedFiles[req.user.username];

        if (!resultFiles) {
            res.redirect('/upload');
        }
        else {
            var files = [];
            for(var file in resultFiles) {
                files.push(resultFiles[file]);
            }

            uploadedFiles[req.user.username] = undefined;

            res.render('../views/files/result', { files: files });
        }
    },
    download: function(req, res, next) {
        var url = req.params.id;
        console.log(url);
        var decryptedUrl = encryption.decrypt(url, URL_PASSWORD);

        res.download(__dirname + '/../../files' + decryptedUrl);
    }
};

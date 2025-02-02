var mongoose = require('mongoose'),
    user = require('../models/User'),
    file = require('../models/File'),
    phone = require('../models/Phone'),
    tablet = require('../models/Tablet'),
    wearable = require('../models/Wearable');

module.exports = function (config) {
    mongoose.connect(config.db);
    var db = mongoose.connection;

    db.once('open', function (err) {
        if (err) {
            console.log('Database could not be opened: ' + err);
            return;
        }

        console.log('Database up and running...')
    });

    db.on('error', function (err) {
        console.log('Database error: ' + err);
    });

    user.seedInitialUsers();
    file.init();
    phone.seedInitialPhones();
    tablet.seedInitialTablets();
    wearable.seedInitialWearables();
};

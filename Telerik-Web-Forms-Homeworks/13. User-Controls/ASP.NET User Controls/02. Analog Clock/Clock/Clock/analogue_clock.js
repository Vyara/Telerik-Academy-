// Global variable
var clock_face = null,
	hour_hand = null,
	minute_hand = null,
	second_hand = null,
	ctx = null,
	degrees = 0;

var HEIGHT = 500;
var WIDTH = 500;

function clearCanvas() {
	 // clear canvas
	ctx.clearRect(0, 0, HEIGHT, WIDTH);
}

function getRequiredMinuteAngle(currentTime) {
	// Calculate the expected angle
	return Math.floor(((360 / 60) * currentTime.getMinutes()), 0);
}

function getRequiredHourAngle(currentTime) {
	// Calculate the expected angle
	return Math.floor(((360 / 12) * currentTime.getHours()), 0);
}

function getRequiredSecondAngle(currentTime) {
	// Calculate the expected angle
	return Math.floor(((360 / 60) * currentTime.getSeconds()), 0);
}

function rotateAndDraw(image, angle) {
	// Rotate around this point
	ctx.rotate(angle * (Math.PI / 180));

	// Draw the image back and up
	ctx.drawImage(image, 0 - HEIGHT / 2, 0 - WIDTH / 2);

	ctx.rotate(-angle * (Math.PI / 180));
}

function draw() {
    var currentTime = new Date();
    var hoursToAdd = parseInt(document.getElementById("timeZoneHolder").firstElementChild.getAttribute("value"));

    currentTime.setHours(currentTime.getHours() + hoursToAdd);

	clearCanvas();

	// Draw the clock onto the canvas
	ctx.drawImage(clock_face, 0, 0);

	// Save the current drawing state
	ctx.save();

	// Now move across and down half way
	ctx.translate(HEIGHT / 2, WIDTH / 2);

	rotateAndDraw(minute_hand, getRequiredMinuteAngle(currentTime));

	rotateAndDraw(hour_hand, getRequiredHourAngle(currentTime));

	rotateAndDraw(second_hand, getRequiredSecondAngle(currentTime));

	// Restore the previous drawing state
	ctx.restore();
}

function imgLoaded() {
	// Image loaded event complete.  Start the timer
	setInterval(draw, 500);
}

function init() {
	// Grab the clock element
	var canvas = document.getElementById('clock');

	// Canvas supported?
	if (canvas.getContext('2d')) {
		ctx = canvas.getContext('2d');

		// Load the hor hand image
		hour_hand = new Image();
		hour_hand.src = 'Clock/hour_hand.png';

		// Load the minute hand image
		minute_hand = new Image();
		minute_hand.src = 'Clock/minute_hand.png';

		// Load the minute hand image
		second_hand = new Image();
		second_hand.src = 'Clock/second_hand.png';

		// Load the clock face image
		clock_face = new Image();
		clock_face.src = 'Clock/clock_face.png';
		clock_face.onload = imgLoaded;

	} else {
		alert("Canvas not supported!");
	}
}
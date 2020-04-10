// Collapse Copy DESKTOP ACCORDION

// Button 1
$("#collapse-1").click(function (e) {
    $("#headingOne > svg").toggleClass("rotate-chevron");
});
// Hide dropdown menu on click outside
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingOne").length == 0) {
        $("#headingOne > svg").removeClass("rotate-chevron")
    }
});


// Button 2
$("#collapse-2").click(function (e) {
    $("#headingTwo > svg").toggleClass("rotate-chevron");
});
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingTwo").length == 0) {
        $("#headingTwo > svg").removeClass("rotate-chevron")
    }
});


// Button 3
$("#collapse-3").click(function () {
    $("#headingThree > svg").toggleClass("rotate-chevron");
});
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingThree").length == 0) {
        $("#headingThree > svg").removeClass("rotate-chevron")
    }
});


// Button 4
$("#collapse-4").click(function () {
    $("#headingFour > svg").toggleClass("rotate-chevron");
});
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingFour").length == 0) {
        $("#headingFour > svg").removeClass("rotate-chevron")
    }
});


// Button 5
$("#collapse-5").click(function () {
    $("#headingFive > svg").toggleClass("rotate-chevron");
});
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingFive").length == 0) {
        $("#headingFive > svg").removeClass("rotate-chevron")
    }
});

// Button 6
$("#collapse-6").click(function () {
    $("#headingSix > svg").toggleClass("rotate-chevron");
});
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingSix").length == 0) {
        $("#headingSix > svg").removeClass("rotate-chevron")
    }
});

/********************************/
/* MOBILE BUTTON ICON COLLAPSE */
/******************************/

// Button 1
$("#collapse-1M").click(function (e) {
    $("#headingMOne > svg").toggleClass("rotate-chevron");
});
// Hide dropdown menu on click outside
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingMOne").length == 0) {
        $("#headingMOne > svg").removeClass("rotate-chevron")
    }
});
// Button 2
$("#collapse-2M").click(function (e) {
    $("#headingMTwo > svg").toggleClass("rotate-chevron");
});
// Hide dropdown menu on click outside
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingMTwo").length == 0) {
        $("#headingMTwo > svg").removeClass("rotate-chevron")
    }
});
// Button 3
$("#collapse-3M").click(function (e) {
    $("#headingMThree > svg").toggleClass("rotate-chevron");
});
// Hide dropdown menu on click outside
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingMThree").length == 0) {
        $("#headingMThree > svg").removeClass("rotate-chevron")
    }
});
// Button 4
$("#collapse-4M").click(function (e) {
    $("#headingMFour > svg").toggleClass("rotate-chevron");
});
// Hide dropdown menu on click outside
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingMFour").length == 0) {
        $("#headingMFour > svg").removeClass("rotate-chevron")
    }
});
// Button 5
$("#collapse-5M").click(function (e) {
    $("#headingMFive > svg").toggleClass("rotate-chevron");
});
// Hide dropdown menu on click outside
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingMFive").length == 0) {
        $("#headingMFive > svg").removeClass("rotate-chevron") 
    }
});
// Button 6
$("#collapse-6M").click(function (e) {
    $("#headingMSix > svg").toggleClass("rotate-chevron");
});
// Hide dropdown menu on click outside
$(document).on("click", function (event) {
    if ($(event.target).closest("#headingMSix").length == 0) {
        $("#headingMSix > svg").removeClass("rotate-chevron")
    }
});



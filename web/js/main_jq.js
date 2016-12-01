var operandsRegex = /.*(\+|-|\*|\/).*/;
var actualValue = "0";
var display;

$(document).ready(function () {
    initCalculator();
});

var initCalculator = function () {
    display = $('#calcDisplay');
    var numerals = $('.numerals');
    var actions = $('.actions');
    var operands = $('.operands');
    var specials = $('.specials');
    numerals.each(initNumeral);
    actions.each(initAction);
    operands.each(initOperands);
    specials.each(initSpecial);
    adjustDisplay();
};

var initNumeral = function (index) {
    this.innerHTML = $(this).data("value");
    $(this).click(numeralClick);
};

var initAction = function (index) {
    this.innerHTML = $(this).data("text");
    $(this).click(actionClick);
};

var initSpecial = function (index) {
    this.innerHTML = $(this).data("text");
    $(this).click(specialClick);
};

var initOperands = function (index) {
    this.innerHTML = $(this).data("text");
    $(this).click(operandsClick);
};

var adjustDisplay = function () {
    display.html(actualValue);
};

var numeralClick = function () {
    var char = $(this).data("value").toString();

    if (char != ".") {
        if (actualValue == "0")
            actualValue = char;
        else
            actualValue = actualValue + char;
    }
    else {
        if (actualValue != "0") {
            // If the numeral does not have
            if (!actualValue.match(operandsRegex)) {
                actualValue = actualValue.includes(".") ? actualValue : actualValue + char;
            }
            // TODO: Fix point placement
        } else
            actualValue = actualValue + char;
    }
    adjustDisplay();
};

var actionClick = function () {
    var action = $(this).data("action");
    switch (action) {
        case "delete":
            actualValue = actualValue.length > 1 ? actualValue.substring(0, (actualValue.length - 1)) : "0";
            break;
        case "all_clear":
            actualValue = "0";
            break;
        default:
            break;
    }
    adjustDisplay();
};

var operandsClick = function () {
    var operand = $(this);
    var action = operand.data("action");
    var text = operand.data("text");
    actualValue = actualValue + text;
    adjustDisplay();
};

var specialClick = function () {
    var special = $(this);
    var display = special.data("display");
    if (display == null) {
        console.debug("Calling api...");
        return;
    }
    actualValue = display == "^" ? actualValue + display : display;
    adjustDisplay();
};
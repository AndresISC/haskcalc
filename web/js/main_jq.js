var operandsRegex;
var specialsRegex;
var actualValue = "0";
var display;
var defOut;

$(document).ready(function () {
    initCalculator();
    display.bind("DOMSubtreeModified",function(){
        actualValue = display.html();
    });
});

var initCalculator = function () {
    display = $('#calcDisplay');
    defOut = $('#output');
    operandsRegex = new RegExp(/(\+)|(\/)|(x)|(!)/);
    specialsRegex = new RegExp(/(sin)|(cos)|(tan)|(sec)|(csc)|(ctg)/);
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
    $(defOut).attr('value', actualValue);
};

var numeralClick = function () {
    var char = $(this).data("value").toString();

    // No fact
    if (actualValue.includes("!"))
        return;

    if (char != ".") {
        if (actualValue == "0")
            actualValue = char;
        else
            actualValue = actualValue + char;
    }
    else {
        if (actualValue != "0") {
            // If the numeral does not have
            if (!operandsRegex.test(actualValue)) {
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

    if (operandsRegex.test(actualValue) || specialsRegex.test(actualValue)) {
        return;
    }

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

    if (actualValue.includes(display))
        return;

    actualValue = display == "^" || display == "!" ? actualValue + display : display;
    adjustDisplay();
};
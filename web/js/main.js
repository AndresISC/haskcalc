$(document).ready(function () {
    initCalculator();
});

var initCalculator = function () {

    var keys = document.getElementById("keys");
    var numerals = [];
    var actions = [];

    for (var i = 0; i < keys.childNodes.length; i++) {
        var child = keys.childNodes[i];
        if (hasClass(child, "numerals"))
            numerals.push(child);
        else if (hasClass(child, "actions"))
            actions.push(child);
    }
    initNumerals(numerals);
    initActions(actions);
};

var initNumerals = function (numerals) {
    for(var i = 0; i < numerals.length; i++){
        var numeral = numerals[i];
        numeral.innerHTML = numeral.dataset.value;
    }
};

var initActions = function (actions) {
    for(var i = 0; i < actions.length; i++){
        var action = actions[i];
        action.innerHTML = action.dataset.text;
    }
};

var hasClass = function (element, cls) {
    return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
};
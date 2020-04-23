var nextButton = document.getElementsByClassName("carousel-control-next")[0];
var carousel = document.getElementsByClassName("scrollImage")[0]


function clickNextButton () {
    var getValue = nextButton.getAttribute('value');
    if (getValue == 5) { nextButton.setAttribute('value', 0);} 
    else {
        ++getValue;
        nextButton.setAttribute('value', getValue);
    }
    var getNewValue = nextButton.getAttribute('value');
    changeTextImg (getNewValue);
}

function clickPrevButton () {
    var getValue = nextButton.getAttribute('value');
    if (getValue == 0) { nextButton.setAttribute('value', 5); }
    else {
        --getValue;
        nextButton.setAttribute('value', getValue);
    }
    var getNewValue = nextButton.getAttribute('value');
    changeTextImg (getNewValue);
}

function changeTextImg (getValue) {
    if (getValue == 0) {
        carousel.getElementsByClassName("instruction")[0].innerHTML = "In this game, you have to use M5 Stack in order to play the game. You are able to use M5 Stack to control the (Name's) movement and to shoot the \"flying gift\".";
    }
    else if (getValue == 1) {
        carousel.getElementsByClassName("instruction")[0].innerHTML = "You are able to control (Name) to move to left (right) with pressing the left (right) button of M5 Stack.";
    }
    else if (getValue == 2) {
        carousel.getElementsByClassName("instruction")[0].innerHTML = "Eat as much as you can in order to increase your points. Each food do have a corresponding point, your points will not be deduced if you miss the food.";
    }
    else if (getValue == 3) {
        carousel.getElementsByClassName("instruction")[0].innerHTML = "Keep away from the bomb otherwise you will die!!";
    }
    else if (getValue == 4) {
        carousel.getElementsByClassName("instruction")[0].innerHTML = "If you see the gift appears, use M5 Stack to point to the gift and press the middle button for shooting. You will get extra points.";
    }
    else if (getValue == 5) {
        carousel.getElementsByClassName("instruction")[0].innerHTML = "Each food has a corresponding points.";
    }
}


function animateDiver(sprite) {
  var elem = document.getElementById("frog-man");
  elem.style.backgroundImage=sprite;
  var pos = 0;
  var id = setInterval(frame, 10);
  function frame() {
    if (pos == 1080) {
      clearInterval(id);
      elem.style.display = "none";
    } else {
      pos++;
      elem.style.top = pos + 'px';
      elem.style.left = pos + 'px';
    }
  }
}

var imgs = ["2019-woman-diving-animation.gif",
            "animated-diver-2.gif",
            "animated-diver.gif",
            "diver-animation-bubbles.gif",
            "diver-octopus.gif",
            "diver-underwater-animated.gif",
            "frog-man-diving.gif",
            "shark-diving-animation.gif"]

var my_image = imgs[Math.floor(Math.random()*imgs.length)]

animateDiver("url('images/"+my_image+"')")
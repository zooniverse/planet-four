// Keep Kinetic from totally breaking in IE8
// so we can at least show the browser warning.

(function() {
  var canvas = document.createElement('canvas');

  try {
    canvas.getContext('2d');
  } catch(e) {
    canvas.constructor.prototype.getContext = function() {return {};};
  }
}());

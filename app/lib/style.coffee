module.exports =
  target:
    fill: 'gray'
    stroke: 'white'
    strokeWidth: 1
    opacity: 0.25

  source:
    radius: 5
    fill: 'black'
    stroke: 'white'
    strokeWidth: 2

  distance:
    radius: 5
    rotationDeg: 90
    fill: 'black'
    stroke: 'white'
    strokeWidth: 2

  spread:
    sides: 4
    radius: 5
    fill: 'white'
    stroke: 'white'
    strokeWidth: 2

  realLine:
    stroke: 'white'
    strokeWidth: 1
    dashArray: [5, 5]

  guideLine:
    fill: 'rgba(0, 255, 0, 0.25)'
    stroke: 'white'
    strokeWidth: 2

  cursors:
    distance: 'crosshair'
    spread: 'crosshair'
    bounding: 'move'

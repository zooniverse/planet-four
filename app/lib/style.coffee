module.exports =
  target:
    fill: 'rgba(127, 127, 127, 0.25)'

  source:
    radius: 10
    fill: 'black'
    stroke: 'white'
    strokeWidth: 2

  distance:
    sides: 4
    radius: 5
    rotationDeg: 90
    fill: 'yellow'
    stroke: 'black'
    strokeWidth: 1

  spread:
    sides: 4
    radius: 5
    fill: 'yellow'
    stroke: 'black'
    strokeWidth: 1

  realLine:
    stroke: 'white'
    strokeWidth: 2
    shadow: color: 'black', blur: 1, offset: [0, 1]

  guideLine:
    stroke: 'white'
    strokeWidth: 2
    shadow: color: 'black', blur: 1, offset: [0, 1]

  cursors:
    source: 'move'
    distance: 'move'
    spread: 'move'

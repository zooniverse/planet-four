module.exports =
  target:
    fill: 'gray'
    stroke: 'white'
    strokeWidth: 1
    opacity: 0.01

  circle:
    radius: if !!~navigator.userAgent.indexOf 'iP' then 20 else 7
    rotationDeg: 90
    fill: 'black'
    stroke: 'white'
    strokeWidth: 2

  diamond:
    sides: 4
    radius: if !!~navigator.userAgent.indexOf 'iP' then 20 else 7
    fill: 'white'

  dash:
    stroke: 'white'
    strokeWidth: 1
    opacity: 0.33

  line:
    fill: 'rgba(127, 127, 127, 0.01)'
    stroke: 'white'
    strokeWidth: 1

  hiddenLine:
    opacity: 0

  cursors:
    distance: 'crosshair'
    spread: 'crosshair'
    radius1: 'crosshair'
    radius2: 'crosshair'
    bounding: 'move'
    hiddenBound: 'move'
    point: 'move'

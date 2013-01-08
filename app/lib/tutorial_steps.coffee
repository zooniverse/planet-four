{Tutorial} = require 'zootorial'
{Step} = Tutorial

module.exports = [
  new Step
    header: 'Welcome to Planet Four!'
    content: 'This short tutorial will show you how to help explore the surface of Mars: an alien world.'
    attachment: to: '.subject-container'

  new Step
    content: 'This photo was taken by a satellite orbiting Mars. We\'re going to mark deposits of dust on the Martian surface. Some will be in neat fans, other will be in blotches. See the About page for more information on how these patterns form.'
    attachment: y: 'top', to: '.subject-container', at: y: 'top'
    focus: '.subject-container'

  new Step
    content: 'The first deposit we see here is a fan, so make sure the Fan tool is selected.'
    attachment: x: 'left', to: '.for-fan', at: x: 'right'
    focus: '.classification-tools'

  new Step
    content: 'We\'ll start with the fan toward the top right. Hold down your mouse at the source where the fan originates, then drag right to the area where the streak begins to fade away and release your mouse.'
    attachment: x: 'right', to: '.subject-container', at: x: 'right'
    nextOn: 'first-drag': '.subject-container'

  new Step
    content: 'Now drag one of the diamond-shaped handles to adjust the spread of the fan until it matches the image.'
    attachment: x: 'right', to: '.subject-container', at: x: 'right'
    nextOn: 'drag-spread': '.subject-container'

  new Step
    content: 'The deposit below has no identifiable source, so let\'s mark it using the "blotch" tool.'
    attachment: x: 'left', to: '.for-blotch', at: x: 'right'
    nextOn: 'change': '.for-blotch input'

  new Step
    content: 'Hold your mouse down near the center of the deposit and drag out to the widest point before releasing.'
    attachment: x: 'left', to: '.subject-container', at: x: 'left'
    nextOn: 'first-drag': '.subject-container'

  new Step
    content: 'Now adjust the size of the other radius to match the deposit. Some blotches won\'t be quite circular. Just surround them as best you can.'
    attachment: x: 'left', to: '.subject-container', at: x: 'left'
    nextOn: 'drag-radius2': '.subject-container'

  new Step
    content: 'Great. Now you\'re ready to make some classifications of your own. Click "Finished" to move on to a new subject.'
    attachment: x: 'left', to: 'button[name="finish"]', at: x: 'right'
    nextOn: 'click': 'button[name="finish"]'

  new Step
    content: 'Some images will have many deposits, some will have none. Some fans will share a source -- please mark them all!'
    attachment: x: 'left', to: '.followup .talk', at: x: 'right'

  new Step
    content: 'You can ask questions and discuss your findings with the Planet Four science team and other citizen scientists after you\'ve finished classifying each subject. Have fun exploring!'
    attachment: x: 'left', to: '.followup .talk', at: x: 'right'
]

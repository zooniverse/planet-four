{Tutorial} = require 'zootorial'
{Step} = Tutorial

module.exports = [
  new Step
    header: 'Welcome to Planet Four!'
    content: 'This short tutorial will show you how you can help scientists study weather patterns on Mars.'
    attachment: to: '.subject-container'

  new Step
    content: 'This photo was taken by a satellite orbiting Mars. We\'re going to mark fans of dust, blotchy patterns, and anything else that the science team might find interesting.'
    attachment: y: 'top', to: '.subject-container', at: y: 'top'
    focus: '.subject-container'

  new Step
    content: 'Take a look at the tools, and make sure the Fan tool is selected.'
    attachment: x: 'left', to: '.classification-tools label:first-child', at: x: 'right'
    focus: '.classification-tools'

  new Step
    content: 'We will start with the long, straight streak on the left. Hold down your mouse at the source, then drag up into the area where the streak begins to fade away and release.'
    attachment: x: 'left', y: 'top', to: '.subject-container', at: x: 'left', y: 'top'
    nextOn: 'first-drag': '.subject-container'

  new Step
    content: 'Because the streak is relatively straight, we can leave the marking as a stright line. The trail of dust next to it is more fan shaped. Let\'s mark it!'
    attachment: x: 'left', y: 'top', to: '.subject-container', at: x: 'left', y: 'top'

  new Step
    content: 'Again, hold your mouse down at the source and drag to the area where the fan fades away...'
    attachment: x: 'center', y: 'top', to: '.subject-container', at: x: 'center', y: 'top'
    nextOn: 'first-drag': '.subject-container'

  new Step
    content: '...and then drag one of the diamond-shaped controls out to define the spread of the fan.'
    attachment: x: 'center', y: 'top', to: '.subject-container', at: x: 'center', y: 'top'
    nextOn: 'drag-spread': '.subject-container'

  new Step
    content: 'Finally, let\'s mark the dark blotch on the right. Choose the "blotch" tool.'
    attachment: x: 'left', to: '.for-blotch', at: x: 'right'
    nextOn: 'change': 'input[value="blotch"]'

  new Step
    content: 'Drag out from the center of the blotch to the wide edge...'
    attachment: x: 'right', y: 'top', to: '.subject-container', at: x: 'right', y: 'top'
    nextOn: 'first-drag': '.subject-container'

  new Step
    content: '...then adjust the height to match the blotch.'
    attachment: x: 'right', y: 'top', to: '.subject-container', at: x: 'right', y: 'top'
    nextOn: 'drag-radius2': '.subject-container'

  new Step
    content: 'Great. Now you\'re ready to make some classifications of your own. Click "Finished" to move on to a new subject.'
    attachment: x: 'left', to: 'button[name="finish"]', at: x: 'right'
    nextOn: 'click': 'button[name="finish"]'

  new Step
    content: 'You can ask questions and discuss your findings with the Planet Four science team and other citizen scientists after you\'ve finished classifying each subject.'
    attachment: x: 'left', to: '.followup .talk', at: x: 'right'
]

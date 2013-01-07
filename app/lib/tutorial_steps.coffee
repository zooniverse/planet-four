{Tutorial} = require 'zootorial'
{Step} = Tutorial

module.exports = [
  new Step
    header: 'Welcome to Planet Four!'
    content: 'This short tutorial will show you how you can help scientists study weather patterns on Mars.'
    attachment: to: '.subject-container'

  new Step
    content: 'This photo was taken by a satellite orbiting Mars. We\'re going to mark deposits of dust on the Martian surface. Some will be in neat fans, other will be in blotches. See the About page for more information on how these patterns form.'
    attachment: y: 'top', to: '.subject-container', at: y: 'top'
    focus: '.subject-container'

  new Step
    content: 'The two deposits we see here are in fans, so make sure the Fan tool is selected.'
    attachment: x: 'left', to: '.classification-tools label:first-child', at: x: 'right'
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
    content: 'There is another fan below, more toward the center. Mark it the same way you marked the first one.'
    attachment: x: 'right', to: '.subject-container', at: x: 'right'

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

{Tutorial} = require 'zootorial'
{Step} = Tutorial

module.exports = [
  new Step
    header: 'Welcome to Planet Four!'
    content: 'This short tutorial will show you how you can help scientists study weather patterns on Mars.'
    attachment: to: '.subject-container'

  new Step
    content: 'This photo was taken by a satellite orbiting Mars. We\'re going to highlight the trails of dust.'

  new Step
    content: 'First, make sure the Fan tool is selected.'

  new Step
    content: 'We will start with the long, straight streak on the left. Hold down your mouse at the source, then drag up into the area where the streak begins to fade away and release.'

  new Step
    content: 'Because the streak is relatively straight, we can leave the marking as a stright line. The trail of dust next to it is more fan shaped. Let\'s mark it!'

  new Step
    content: 'Again, hold your mouse down at the source and drag to the area where the fan fades away...'

  new Step
    content: '...and then drag one of the diamon-shaped controls out to define the spread of the fan.'

  new Step
    content: 'Finally, let\'s mark the dark cloud on the right. Choose the "blotch" tool.'

  new Step
    content: 'Great. Now you\'re ready to make some classifications of your own.'
]

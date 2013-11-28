{Tutorial, Step} = require 'zootorial'

module.exports =
  welcome: new Step
    header: 'Welcome to Planet Four!'
    details: 'This short tutorial will show you how to help explore the surface of Mars: an alien world.'
    attachment: 'center center .subject-container center center'
    next: 'overview'

  overview: new Step
    details: 'This photo was taken by a satellite orbiting Mars. We\'re going to mark deposits of dust on the Martian surface. Some will be in neat fans, other will be in blotches. See the About page for more information on how these patterns form.'
    attachment: 'center top .subject-container center top'
    focus: '.subject-container'
    next: 'firstDeposit'

  firstDeposit: new Step
    details: 'The first deposit we see here is a fan, so make sure the Fan tool is selected.'
    attachment: 'left top .classification-tools right top'
    focus: '.classification-tools'
    next: 'fanTool'

  fanTool: new Step
    details: 'We\'ll start with the fan toward the top right. Hold down your mouse at the source where the fan originates, then drag right to the area where the streak begins to fade away and release your mouse.'
    attachment: 'right center .subject-container right center'
    next: 'first-drag .subject-container': 'fanUse'

  fanUse: new Step
    details: 'Now drag one of the diamond-shaped handles to adjust the spread of the fan until it matches the image.'
    attachment: 'right middle .subject-container right center'
    next: 'drag-spread .subject-container': 'blotchTool'

  blotchTool: new Step
    details: 'The deposit below has no identifiable source, so let\'s mark it using the "blotch" tool.'
    attachment: 'left center .for-blotch right center'
    focus: '.classification-tools'
    next: 'change .for-blotch input': 'blotchUse'

  blotchUse: new Step
    details: 'Hold your mouse down near the center of the deposit and drag out to the widest point before releasing.'
    attachment: 'left top .subject-container left center'
    next: 'first-drag .subject-container': 'adjustRadius'

  adjustRadius: new Step
    details: 'Now adjust the size of the other radius to match the deposit. Some blotches won\'t be quite circular. Just surround them as best you can.'
    attachment: 'left center .subject-container left center'
    next: 'drag-radius2 .subject-container': 'finish'

  finish: new Step
    details: 'Great. Now you\'re ready to make some classifications of your own. Click "Finished" to move on to a new subject.'
    attachment: 'left center button[name="finish"] right center'
    next: 'click button[name="finish"]': 'manyFans'

  manyFans: new Step
    details: 'Some images will have many deposits, some will have none. Some fans will share a source -- please mark them all!'
    attachment: 'center middle .subject-container center middle'
    next: 'talk'

  talk: new Step
    details: 'You can ask questions and discuss your findings with the Planet Four science team and other citizen scientists after you\'ve finished classifying each subject. You can also bring an image to the attention of the science team using the "interesting feature" tool. Have fun exploring!'
    attachment: 'center middle .subject-container center middle'

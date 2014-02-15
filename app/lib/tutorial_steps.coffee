{Tutorial, Step} = require 'zootorial'
t = require 't7e'

module.exports =
  welcome: new Step
    header: t 'span', 'tutorial.welcome.header'
    details: t 'span', 'tutorial.welcome.details'
    attachment: 'center center .subject-container center center'
    next: 'overview'
    nextButton: t 'span', 'tutorial.nextButton'

  overview: new Step
    details: t 'span', 'tutorial.overview.details'
    attachment: 'center top .subject-container center top'
    focus: '.subject-container'
    next: 'firstDeposit'
    nextButton: t 'span', 'tutorial.nextButton'

  firstDeposit: new Step
    details: t 'span', 'tutorial.firstDeposit.details'
    attachment: 'left top .classification-tools right top'
    focus: '.classification-tools'
    next: 'fanTool'
    nextButton: t 'span', 'tutorial.nextButton'

  fanTool: new Step
    details: t 'span', 'tutorial.fanTool.details'
    attachment: 'right center .subject-container right center'
    next: 'first-drag .subject-container': 'fanUse'
    nextButton: t 'span', 'tutorial.nextButton'

  fanUse: new Step
    details: t 'span', 'tutorial.fanUse.details'
    attachment: 'right middle .subject-container right center'
    next: 'drag-spread .subject-container': 'blotchTool'
    nextButton: t 'span', 'tutorial.nextButton'

  blotchTool: new Step
    details: t 'span', 'tutorial.blotchTool.details'
    attachment: 'left center .for-blotch right center'
    focus: '.classification-tools'
    next: 'change .for-blotch input': 'blotchUse'
    nextButton: t 'span', 'tutorial.nextButton'

  blotchUse: new Step
    details: t 'span', 'tutorial.blotchUse.details'
    attachment: 'left top .subject-container left center'
    next: 'first-drag .subject-container': 'adjustRadius'
    nextButton: t 'span', 'tutorial.nextButton'

  adjustRadius: new Step
    details: t 'span', 'tutorial.adjustRadius.details'
    attachment: 'left center .subject-container left center'
    next: 'drag-radius2 .subject-container': 'finish'
    nextButton: t 'span', 'tutorial.nextButton'

  finish: new Step
    details: t 'span', 'tutorial.finish.details'
    attachment: 'left center button[name="finish"] right center'
    next: 'click button[name="finish"]': 'manyFans'
    nextButton: t 'span', 'tutorial.nextButton'

  manyFans: new Step
    details: t 'span', 'tutorial.manyFans.details'
    attachment: 'center middle .subject-container center middle'
    next: 'talk'
    nextButton: t 'span', 'tutorial.nextButton'

  talk: new Step
    details: t 'span', 'tutorial.talk.details'
    attachment: 'center middle .subject-container center middle'
    nextButton: t 'span', 'tutorial.nextButton'

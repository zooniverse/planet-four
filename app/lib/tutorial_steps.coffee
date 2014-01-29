{Tutorial, Step} = require 'zootorial'
t = require 't7e'

module.exports =
  welcome: new Step
    header: t 'span', 'tutorial.welcome.header'
    details: t 'span', 'tutorial.welcome.details'
    attachment: 'center center .subject-container center center'
    next: 'overview'

  overview: new Step
    details: t 'span', 'tutorial.overview.details'
    attachment: 'center top .subject-container center top'
    focus: '.subject-container'
    next: 'firstDeposit'

  firstDeposit: new Step
    details: t 'span', 'tutorial.firstDeposit.details'
    attachment: 'left top .classification-tools right top'
    focus: '.classification-tools'
    next: 'fanTool'

  fanTool: new Step
    details: t 'span', 'tutorial.fanTool.details'
    attachment: 'right center .subject-container right center'
    next: 'first-drag .subject-container': 'fanUse'

  fanUse: new Step
    details: t 'span', 'tutorial.fanUse.details'
    attachment: 'right middle .subject-container right center'
    next: 'drag-spread .subject-container': 'blotchTool'

  blotchTool: new Step
    details: t 'span', 'tutorial.blotchTool.details'
    attachment: 'left center .for-blotch right center'
    focus: '.classification-tools'
    next: 'change .for-blotch input': 'blotchUse'

  blotchUse: new Step
    details: t 'span', 'tutorial.blotchUse.details'
    attachment: 'left top .subject-container left center'
    next: 'first-drag .subject-container': 'adjustRadius'

  adjustRadius: new Step
    details: t 'span', 'tutorial.adjustRadius.details'
    attachment: 'left center .subject-container left center'
    next: 'drag-radius2 .subject-container': 'finish'

  finish: new Step
    details: t 'span', 'tutorial.finish.details'
    attachment: 'left center button[name="finish"] right center'
    next: 'click button[name="finish"]': 'manyFans'

  manyFans: new Step
    details: t 'span', 'tutorial.manyFans.details'
    attachment: 'center middle .subject-container center middle'
    next: 'talk'

  talk: new Step
    details: t 'span', 'tutorial.talk.details'
    attachment: 'center middle .subject-container center middle'

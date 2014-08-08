{Stack} = require 'spine/lib/manager'
SubPage = require './sub_page'
translate = require 't7e'
developersView = require 'views/developers'
scientistsView = require 'views/scientists'
moderatorsView = require 'views/moderators'

class AboutPage extends Stack
  className: "#{Stack::className} about-page"

  controllers:
    index: require './about'
    examples: class extends SubPage then content: translate 'span', 'about.examples'
    faq: class extends SubPage then content: translate 'span', 'about.faq'
    education: class extends SubPage then content: translate 'span', 'about.education'
    scientists: class extends SubPage then content: scientistsView @
    developers: class extends SubPage then content: developersView @
    moderators: class extends SubPage then content: moderatorsView @
    stargazingLive: class extends SubPage then content: translate 'span', 'about.stargazingLive'


  routes:
    '/about': 'index'
    '/about/examples': 'examples'
    '/about/faq': 'faq'
    '/about/education': 'education'
    '/about/scientists': 'scientists'
    '/about/developers': 'developers'
    '/about/moderators': 'moderators'
    '/about/stargazing-live': 'stargazingLive'

  default: 'index'

module.exports = AboutPage

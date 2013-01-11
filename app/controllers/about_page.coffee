{Stack} = require 'spine/lib/manager'
SubPage = require './sub_page'
translate = require 'translate'
developersView = require 'views/developers'
scientistsView = require 'views/scientists'

class AboutPage extends Stack
  className: "#{Stack::className} about-page"

  controllers:
    index: class extends SubPage then content: translate 'about.index'
    examples: class extends SubPage then content: translate 'about.examples'
    faq: class extends SubPage then content: translate 'about.faq'
    education: class extends SubPage then content: translate 'about.education'
    scientists: class extends SubPage then content: scientistsView @
    developers: class extends SubPage then content: developersView @
    stargazingLive: class extends SubPage then content: translate 'about.stargazingLive'

  routes:
    '/about': 'index'
    '/about/examples': 'examples'
    '/about/faq': 'faq'
    '/about/education': 'education'
    '/about/scientists': 'scientists'
    '/about/developers': 'developers'
    '/about/stargazing-live': 'stargazingLive'

  default: 'index'

module.exports = AboutPage

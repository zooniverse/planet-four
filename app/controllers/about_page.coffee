{Stack} = require 'spine/lib/manager'
SubPage = require './sub_page'
translate = require 'lib/translate'

class AboutPage extends Stack
  className: "#{Stack::className} about-page"

  controllers:
    index: class extends SubPage then content: translate 'about.index'
    research: class extends SubPage then content: translate 'about.research'
    scientists: class extends SubPage then content: translate 'about.scientists'
    developers: class extends SubPage then content: translate 'about.developers'
    citizenScience: class extends SubPage then content: translate 'about.citizenScience'
    stargazingLive: class extends SubPage then content: translate 'about.stargazingLive'

  routes:
    '/about': 'index'
    '/about/research': 'research'
    '/about/scientists': 'scientists'
    '/about/developers': 'developers'
    '/about/citizen-science': 'citizenScience'
    '/about/stargazing-live': 'stargazingLive'

  default: 'index'

module.exports = AboutPage

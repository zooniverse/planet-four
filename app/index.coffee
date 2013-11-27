require 'lib/setup'

Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'

Api = require 'zooniverse/lib/api'
User = require 'zooniverse/models/user'
TopBar = require 'zooniverse/controllers/top-bar'
googleAnalytics = require 'zooniverse/lib/google-analytics'

Navigation = require 'controllers/navigation'
HomePage = require 'controllers/home_page'
ClassifyPage = require 'controllers/classify_page'
AboutPage = require 'controllers/about_page'
ProfilePage = require 'controllers/profile_page'

new Api project: 'planet_four'

app = {}
app.container = $('#app')

app.navigation = new Navigation
app.navigation.el.appendTo app.container

app.stack = new Stack
  className: "app-main #{Stack::className}"

  controllers:
    home: HomePage
    classify: ClassifyPage
    about: AboutPage
    profile: ProfilePage

  routes:
    '/home': 'home'
    '/classify': 'classify'
    '/about': 'about'
    '/profile': 'profile'

  default: 'home'

app.stack.classify.classificationTools.el.appendTo app.navigation.classificationToolsContainer
app.stack.el.appendTo app.container

app.topBar = new TopBar
app.topBar.el.prependTo 'body'

Route.setup()
User.fetch()

new googleAnalytics account: 'UA-1224199-41'

module.exports = app

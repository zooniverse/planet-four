require 'lib/setup'

Api = require 'zooniverse/lib/api'
Navigation = require 'controllers/navigation'
Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'
HomePage = require 'controllers/home_page'
ClassifyPage = require 'controllers/classify_page'
AboutPage = require 'controllers/about_page'
ProfilePage = require 'controllers/profile_page'
User = require 'zooniverse/lib/models/user'
TopBar = require 'zooniverse/lib/controllers/top_bar'
googleAnalytics = require 'zooniverse/lib/google_analytics'
# require 'zootorial/google-analytics'

Api.init
  host: if !!location.href.match /demo|beta/
    'https://dev.zooniverse.org'
  else if +location.port < 1024
    'https://api.zooniverse.org'
  else
    'https://dev.zooniverse.org'
    #"#{location.protocol}//#{location.hostname}:3000"
 
app = {}
app.container = $('#app')

app.navigation = new Navigation

app.navigation.el.appendTo app.container

app.stack = new Stack
  className: "app-main #{Stack::className}"

  controllers:
    home: HomePage
    classify: class extends ClassifyPage then constructor: -> try super # At least display in IE8.
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
  app: 'planet_four'
  appName: 'Planet Four'

$(window).on 'request-login-dialog', ->
  app.topBar.onClickSignUp()
  app.topBar.loginForm.signInButton.click()
  app.topBar.loginDialog.reattach()

app.topBar.el.prependTo 'body'

Route.setup()

googleAnalytics.init
  account: 'UA-1224199-41'
  domain: 'planetfour.org'

module.exports = app

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

Api.init
  host: if !!location.href.match /demo|beta/
    'https://dev.zooniverse.org'
  else if +location.port < 1024
    'https://api.zooniverse.org'
  else
    "#{location.protocol}//#{location.hostname}:3000"

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
  app: 'serengeti'
  appName: 'Planet Four'

app.topBar.el.prependTo 'body'

Route.setup()

module.exports = app

require 'lib/setup'

Navigation = require 'controllers/navigation'
Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'
HomePage = require 'controllers/home_page'
ClassifyPage = require 'controllers/classify_page'
AboutPage = require 'controllers/about_page'

app = {}
app.container = $('#app')

app.navigation = new Navigation

app.stack = new Stack
  className: "app-main #{Stack::className}"

  controllers:
    home: HomePage
    classify: ClassifyPage
    about: AboutPage

  routes:
    '/home': 'home'
    '/classify': 'classify'
    '/about': 'about'

  default: 'home'

app.stack.classify.classificationTools.el.appendTo app.navigation.classificationToolsContainer
app.navigation.el.appendTo app.container
app.stack.el.appendTo app.container

Route.setup()

module.exports = app

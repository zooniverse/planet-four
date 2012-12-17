require 'lib/setup'

Navigation = require 'controllers/navigation'
Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'
HomePage = require 'controllers/home_page'
ClassifyPage = require 'controllers/classify_page'

app = {}
app.container = $('#app')

app.navigation = new Navigation

app.stack = new Stack
  className: "app-main #{Stack::className}"

  controllers:
    home: HomePage
    classify: ClassifyPage

  routes:
    '/home': 'home'
    '/classify': 'classify'

  default: 'home'

app.navigation.el.appendTo app.container
app.stack.el.appendTo app.container

Route.setup()

module.exports = app

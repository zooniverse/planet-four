require 'lib/setup'

Navigation = require 'controllers/navigation'
Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'
HomePage = require 'controllers/home_page'
ClassifyPage = require 'controllers/classify_page'

app = {}
app.navigation = new Navigation
app.navigation.el.appendTo '#app'

app.stack = new Stack
  className: "main #{Stack::className}"

  controllers:
    home: HomePage
    classify: ClassifyPage

  routes:
    '/home': 'home'
    '/classify': 'classify'

app.stack.el.appendTo '#app'

module.exports = app

require 'lib/setup'

Route = require 'spine/lib/route'
{Stack} = require 'spine/lib/manager'

translate = require 't7e'

enUs = require 'lib/en_us'
translate.load enUs

Api = require 'zooniverse/lib/api'
User = require 'zooniverse/models/user'

new Api project: 'planet_four'

app = {}
app.container = $('#app')

Navigation = require 'controllers/navigation'
app.navigation = new Navigation
app.navigation.el.appendTo app.container

app.stack = new Stack
  className: "app-main #{Stack::className}"

  controllers:
    home: require 'controllers/home_page'
    classify: require 'controllers/classify_page'
    about: require 'controllers/about_page'
    profile: require 'controllers/profile_page'

  routes:
    '/home': 'home'
    '/classify': 'classify'
    '/about': 'about'
    '/profile': 'profile'

  default: 'home'

app.stack.classify.classificationTools.el.appendTo app.navigation.classificationToolsContainer
app.stack.el.appendTo app.container

LanguageManager = require 'zooniverse/lib/language-manager'
languageManager = new LanguageManager
  translations:
    en: label: 'English', strings: enUs
    zh_cn: label: '简体中文 Chinese (Simplified)', strings: './translations/zh-cn.json'
    zh_tw: label: '繁體中文 Chinese (Traditional)', strings: './translations/zh-tw.json'
    ru: label: "русский", strings: "./translations/ru.json"
    de: label: 'Deutsch', strings: './translations/de.json'
    fr: label: 'Français', strings: './translations/fr.json'
    pl: label: 'Polski', strings: './translations/pl.json'
    hu: label: 'Magyar', strings: './translations/hu.json'

languageManager.on 'change-language', (e, code, strings) ->
  translate.load strings
  translate.refresh()

TopBar = require 'zooniverse/controllers/top-bar'
app.topBar = new TopBar
app.topBar.el.prependTo 'body'

Route.setup()
User.fetch()

SubjectSelector = require 'controllers/subject-selector'
subjectSelector = new SubjectSelector

googleAnalytics = require 'zooniverse/lib/google-analytics'
new googleAnalytics account: 'UA-1224199-41'

module.exports = app

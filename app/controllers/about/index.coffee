SubPage = require '../sub_page'
translate = require 't7e'
LanguageManager = require 'zooniverse/lib/language-manager'

class AboutIndex extends SubPage
  content: translate 'span', 'about.index'

  constructor: ->
    super
    LanguageManager.on 'change-language', @onLanguageChange

  onLanguageChange: (e, { code }) =>
    if code is 'ru'
      @el.find('figure').eq(1).html """
        <img src="images/about/fan-1-ru.png" />
        <img src="images/about/fan-2-ru.png" />
        <img src="images/about/fan-3-ru.png" />
        <figcaption>Figure 2</figcaption>
      """

module.exports = AboutIndex

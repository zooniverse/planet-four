require 'json2ify'
require 'es5-shimify'

BrowserCheck = require 'zooniverse/lib/controllers/browser_check'
checker = new BrowserCheck
checker.support.mozilla = 12
checker.support.msie = 9
checker.check()

# Load US English by default.
translate = require 't7e'
english = require 'lib/en_us'
translate.load english

# Ensure jQuery loads before Spine.
$ = require 'jqueryify'
spine = require 'spine'

$('html').addClass 'touch' if 'Touch' of window

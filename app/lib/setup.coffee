require 'json2ify'
require 'es5-shimify'

# Load US English by default.
translate = require 't7e'
english = require 'lib/en_us'
translate.load english

# Ensure jQuery loads before Spine.
$ = require 'jqueryify'
spine = require 'spine'

$('html').addClass 'touch' if !!~navigator.userAgent.indexOf 'iP'

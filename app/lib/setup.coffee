require 'json2ify'
require 'es5-shimify'

# Ensure jQuery loads before Spine.
$ = window.jQuery
spine = require 'spine'

$('html').addClass 'touch' if !!~navigator.userAgent.indexOf 'iP'

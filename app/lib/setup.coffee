require 'json2ify'
require 'es5-shimify'

# Load US English by default.
translate = require 'translate'
english = require 'lib/en_us'
translate.load english

# Ensure jQuery loads before Spine.
require 'jqueryify'
require 'spine'

require 'rack'
require './more_rack'

use ToUpper   # For Upcasing response
run Hello
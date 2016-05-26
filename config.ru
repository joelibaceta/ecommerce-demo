# This file add the MP Interceptor
require ::File.expand_path('../lib/on-middle/on-middle.rb', __FILE__)
use OnMiddle

# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

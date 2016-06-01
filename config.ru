# This file add the MP Interceptor
require ::File.expand_path('../lib/mp-sdk-ruby/lib/mercadopago/mpmiddleware.rb', __FILE__)

use MPMiddleware



# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

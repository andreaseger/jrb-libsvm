require 'bundler'
Bundler.setup
Bundler.require(:default, :test)

require 'libsvm'

include Libsvm

# RSpec.configure do |config|
# end

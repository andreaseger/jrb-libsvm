require 'bundler'
Bundler.setup
Bundler.require(:default, :test)
require 'jrb-libsvm'

include Libsvm

RSpec.configure do |config|
end

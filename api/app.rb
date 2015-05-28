require 'v2'
require 'v1'

module Acme
  class App < Grape::API
    mount ::Acme::V2
    mount ::Acme::V1
  end
end

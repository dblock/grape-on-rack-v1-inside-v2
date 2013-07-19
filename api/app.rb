module Acme
  class App < Rack::Cascade
    def initialize
      super [ Acme::V2, Acme::V1 ]
    end
  end
end

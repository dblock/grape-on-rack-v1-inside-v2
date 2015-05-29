module Acme
  class V2 < Grape::API
    format :json
    version 'v2', using: :header, vendor: 'acme', format: :json

    desc 'Returns the current API version, v2.'
    get do
      { version: 'v2' }
    end

    get 'foo' do
      error!('404 Not Found', 404)
    end
  end
end

module Acme
  class V1 < Grape::API
    format :json
    version %w(v2 v1), using: :header, vendor: 'acme', format: :json

    desc 'Returns the current API version, v1.'
    get do
      { version: 'v1' }
    end

    desc 'Returns pong.'
    get 'ping' do
      { ping: 'pong' }
    end

    get 'foo' do
      { bar: 'bar' }
    end
  end
end

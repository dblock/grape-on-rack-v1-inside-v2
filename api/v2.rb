module Acme
  class V2 < Grape::API
    format :json
    version 'v2', using: :header, vendor: 'acme', format: :json

    desc 'Returns the current API version, v2.'
    get do
      { version: 'v2' }
    end

    get 'only_in_v2' do
      { only_in_v2: true }
    end

    get 'in_both_v1_and_v2' do
      { in_both_v1_and_v2: 'v2' }
    end

    get 'found_in_v1_but_not_found_in_v2' do
      error!('404 Not Found', 404)
    end
  end
end

require 'spec_helper'

describe Acme::App do
  include Rack::Test::Methods

  def app
    Acme::App.new
  end

  context 'v2' do
    it 'root returns v2' do
      get '/', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v2+json'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ version: 'v2' }.to_json)
    end
    it 'ping returns v1 pong' do
      get '/ping', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v2+json'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ ping: 'pong' }.to_json)
    end
    it 'foo returns a 404' do
      get '/foo', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v2+json'
      expect(last_response.status).to eq(404)
    end
  end
end

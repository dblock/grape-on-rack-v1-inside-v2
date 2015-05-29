require 'spec_helper'

describe Acme::App do
  include Rack::Test::Methods

  def app
    Acme::App.new
  end

  context 'v1' do
    it 'root returns v1' do
      get '/', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v1+json'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ version: 'v1' }.to_json)
    end
    it 'ping returns v1 pong' do
      get '/ping', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v1+json'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ ping: 'pong' }.to_json)
    end
    it 'foo returns bar' do
      get '/foo', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v1+json'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ bar: 'bar' }.to_json)
    end
  end
end

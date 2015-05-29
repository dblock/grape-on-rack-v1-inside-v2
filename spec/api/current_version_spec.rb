require 'spec_helper'

describe Acme::App do
  include Rack::Test::Methods

  def app
    Acme::App.new
  end

  context 'current' do
    it 'root returns v2' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ version: 'v2' }.to_json)
    end
    it 'ping falls back to v1' do
      get '/ping'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ ping: 'pong' }.to_json)
    end
  end
end

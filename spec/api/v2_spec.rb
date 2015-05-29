require 'spec_helper'

describe Acme::App do
  include Rack::Test::Methods

  def app
    Acme::App
  end

  context 'v2' do
    it 'root returns v2' do
      get '/', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v2+json'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ version: 'v2' }.to_json)
    end
    it 'only_in_v1 returns from v1' do
      get '/only_in_v1', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v2+json'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ only_in_v1: true }.to_json)
    end
    it 'only_in_v2 returns from v2' do
      get '/only_in_v2', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v2+json'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ only_in_v2: true }.to_json)
    end
    it 'in_both_v1_and_v2 returns from v2' do
      get '/in_both_v1_and_v2', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v2+json'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq({ in_both_v1_and_v2: 'v2' }.to_json)
    end
    it 'found_in_v1_but_not_found_in_v2 returns from v2' do
      get '/found_in_v1_but_not_found_in_v2', nil, 'HTTP_ACCEPT' => 'application/vnd.acme-v2+json'
      expect(last_response.status).to eq(404)
    end
    it 'not_found returns a 404' do
      get '/not_found'
      expect(last_response.status).to eq(404)
    end
  end
end

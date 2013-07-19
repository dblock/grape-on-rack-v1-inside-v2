require 'spec_helper'

describe Acme::App do
  include Rack::Test::Methods

  def app
    Acme::App.new
  end

  context "v1" do
    it "root returns v1" do
      get "/", nil, { "HTTP_ACCEPT" => "application/vnd.acme-v1+json" }
      last_response.status.should == 200
      last_response.body.should == { version: "v1" }.to_json
    end
    it "ping returns v1 pong" do
      get "/ping", nil, { "HTTP_ACCEPT" => "application/vnd.acme-v1+json" }
      last_response.status.should == 200
      last_response.body.should == { ping: "pong" }.to_json
    end
  end

end


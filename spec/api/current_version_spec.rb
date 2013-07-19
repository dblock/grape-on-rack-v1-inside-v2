require 'spec_helper'

describe Acme::App do
  include Rack::Test::Methods

  def app
    Acme::App.new
  end

  context "current" do
    it "root returns v2" do
      get "/"
      last_response.status.should == 200
      last_response.body.should == { version: "v2" }.to_json
    end
    it "ping falls back to v1" do
      get "/ping"
      last_response.status.should == 200
      last_response.body.should == { ping: "pong" }.to_json
    end
  end

end


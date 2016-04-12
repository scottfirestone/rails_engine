require "rails_helper"

RSpec.describe "Merchant index", :type => :request do
  it "returns all of the merchants" do
    FactoryGirl.create_list(:merchant, 10)

    get "/api/v1/merchants"

    json = JSON.parse(response.body, symbolize_keys: true)

    expect(response).to be_success
    expect(json.length).to eq(10)
  end
end

require "rails_helper"

RSpec.describe "Merchant show", :type => :request do
  it "returns the merchants" do
    merchant = FactoryGirl.create(:merchant)

    get "/api/v1/merchants/#{merchant.id}.json"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(merchant.attributes.keys)
    expect(json["id"]).to eq(merchant.id)
    expect(json["name"]).to eq(merchant.name)
    expect(json['private_attr']).to eq(nil)
  end
end

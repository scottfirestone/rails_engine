require "rails_helper"

RSpec.describe "Item show", :type => :request do
  it "returns the items" do
    item = FactoryGirl.create(:item)

    get "/api/v1/items/#{item.id}.json"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(item.attributes.keys)
    expect(json["id"]).to eq(item.id)
    expect(json["name"]).to eq(item.name)
    expect(json["description"]).to eq(item.description)
    expect(json["merchant_id"]).to eq(item.merchant_id)
    expect(json['private_attr']).to eq(nil)
  end
end

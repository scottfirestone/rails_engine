require "rails_helper"

RSpec.describe "Item index", :type => :request do
  it "returns all of the items" do
    FactoryGirl.create_list(:item, 10)

    get "/api/v1/items"

    json = parse(response)

    expect(response).to be_success
    expect(json.length).to eq(10)
  end
end

require "rails_helper"

RSpec.describe "Merchant items", :type => :request do
  it "returns all items associated with merchant" do
    merchant = create(:merchant)
    items = create_list(:item, 3)
    merchant.items << items

    get "/api/v1/merchants/#{merchant.id}/items"

    json = parse(response)

    expect(response).to be_success
    expect(json.count).to eq(3)
  end
end

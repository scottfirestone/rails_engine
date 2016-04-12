require "rails_helper"

RSpec.describe "Invoice item", :type => :request do
  it "returns all the invoice items" do
    FactoryGirl.create_list(:invoice_item, 10)

    get "/api/v1/invoice_items.json"

    json = parse(response)

    expect(response).to be_success
    expect(json.length).to eq(10)
  end
end

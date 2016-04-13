require "rails_helper"

RSpec.describe "Invoice item show", :type => :request do
  it "returns the invoice itemss" do
    invoice_item = FactoryGirl.create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}.json"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(invoice_item.attributes.keys)
    expect(json["id"]).to eq(invoice_item.id)
    expect(json["quantity"]).to eq(invoice_item.quantity)
    expect(json["item_id"]).to eq(invoice_item.item_id)
    expect(json["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(json['private_attr']).to eq(nil)
  end
end

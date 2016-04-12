require "rails_helper"

RSpec.describe "Invoice show", :type => :request do
  it "returns the invoices" do
    invoice = FactoryGirl.create(:invoice)

    get "/api/v1/invoices/#{invoice.id}.json"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(invoice.attributes.keys)
    expect(json["id"]).to eq(invoice.id)
    expect(json["status"]).to eq(invoice.status)
    expect(json["merchant_id"]).to eq(invoice.merchant_id)
    expect(json["customer_id"]).to eq(invoice.customer_id)
    expect(json['private_attr']).to eq(nil)
  end
end

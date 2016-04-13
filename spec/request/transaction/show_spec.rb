require "rails_helper"

RSpec.describe "Transaction show", :type => :request do
  it "returns the transactions" do
    FactoryGirl.create(:invoice)
    transaction = FactoryGirl.create(:transaction)

    get "/api/v1/transactions/#{transaction.id}.json"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(transaction.attributes.keys)
    expect(json["id"]).to eq(transaction.id)
    expect(json["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(json["result"]).to eq(transaction.result)
    expect(json["invoice_id"]).to eq(transaction.invoice_id)
    expect(json['private_attr']).to eq(nil)
  end
end

require "rails_helper"

RSpec.describe "Transaction index", :type => :request do
  it "returns all of the transactions" do
    FactoryGirl.create_list(:transaction, 10)

    get "/api/v1/transactions.json"

    json = parse(response)

    expect(response).to be_success
    expect(json.length).to eq(10)
  end
end

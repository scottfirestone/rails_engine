require "rails_helper"

RSpec.describe "Invoice index", :type => :request do
  it "returns all of the invoices" do
    FactoryGirl.create_list(:invoice, 10)

    get "/api/v1/invoices"

    json = parse(response)

    expect(response).to be_success
    expect(json.length).to eq(10)
  end
end

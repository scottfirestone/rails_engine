require "rails_helper"

RSpec.describe "Customer index", :type => :request do
  it "returns all of the customers" do
    FactoryGirl.create_list(:customer, 10)

    get "/api/v1/customers.json"
    
    json = parse(response)

    expect(response).to be_success
    expect(json.length).to eq(10)
  end
end

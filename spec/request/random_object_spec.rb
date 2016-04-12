require "rails_helper"

RSpec.describe "Random", :type => :request do
  it "returns a random customer" do
    FactoryGirl.create_list(:customer, 2)

    get "/api/v1/customers/random.json"

    json = parse(response)

    expect(response).to be_success
    expect(json.class).to eq(Hash)
    expect(json.keys).to eq(Customer.new.attributes.keys)
  #can strength this test??  
  end
end

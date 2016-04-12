require "rails_helper"

RSpec.describe "Customer show", :type => :request do
  it "returns the customers" do
    customer = FactoryGirl.create(:customer)

    get "/api/v1/customers/#{customer.id}.json"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(customer.attributes.keys)
    expect(json["id"]).to eq(customer.id)
    expect(json["first_name"]).to eq(customer.first_name)
    expect(json["last_name"]).to eq(customer.last_name)
    expect(json['private_attr']).to eq(nil)
  end
end

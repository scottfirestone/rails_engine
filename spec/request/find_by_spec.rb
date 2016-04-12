require "rails_helper"

RSpec.describe "Find by", :type => :request do
  it "finds the customer by id" do
    customer = FactoryGirl.create(:customer)

    get "/api/v1/customer/find?id=#{customer.id}"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(customer.attributes.keys)
    expect(json["id"]).to eq(customer.id)
    expect(json["first_name"]).to eq(customer.first_name)
    expect(json["last_name"]).to eq(customer.last_name)
    expect(json['private_attr']).to eq(nil)
  end

  it "finds the customer by first_name" do
    customer = FactoryGirl.create(:customer)

    get "/api/v1/customer/find?first_name=#{customer.first_name}"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(customer.attributes.keys)
    expect(json["id"]).to eq(customer.id)
    expect(json["first_name"]).to eq(customer.first_name)
    expect(json["last_name"]).to eq(customer.last_name)
    expect(json['private_attr']).to eq(nil)
  end
end

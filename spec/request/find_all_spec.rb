require "rails_helper"

RSpec.describe "Find all", :type => :request do
  it "finds all the customer by first name" do
    2.times do
      FactoryGirl.create(:customer)
      Customer.last.update_attribute(:first_name, "Scott")
    end

    get "/api/v1/customers/find_all?first_name=Scott"

    json = parse(response)

    expect(response).to be_success
    expect(json.length).to eq(2)
    expect(json.first["first_name"]).to eq("Scott")
    expect(json.last["first_name"]).to eq("Scott")
  end
end

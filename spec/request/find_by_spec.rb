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

  it "finds the customer by last_name" do
    customer = FactoryGirl.create(:customer)

    get "/api/v1/customer/find?last_name=#{customer.last_name}"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(customer.attributes.keys)
    expect(json["id"]).to eq(customer.id)
    expect(json["first_name"]).to eq(customer.first_name)
    expect(json["last_name"]).to eq(customer.last_name)
    expect(json['private_attr']).to eq(nil)
  end

  it "finds the invoice item by the quantity" do
    invoice_item = FactoryGirl.create(:invoice_item)

    get "/api/v1/invoice_item/find?quantity=#{invoice_item.quantity}"

    json = parse(response)

    expect(response).to be_success
    expect(json.keys).to eq(invoice_item.attributes.keys)
    expect(json["id"]).to eq(invoice_item.id)
    expect(json["quantity"]).to eq(invoice_item.quantity)
    expect(json["unit_price"]).to eq(invoice_item.unit_price)
    expect(json["item_id"]).to eq(invoice_item.item_id)
    expect(json["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(json['private_attr']).to eq(nil)
  end
end

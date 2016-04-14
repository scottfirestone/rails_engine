require "rails_helper"

RSpec.describe "Favorite merchant", :type => :request do
  it "finds a customers top merchant" do
    customer                    = create(:customer)
    merchant1, merchant2        = create_list(:merchant, 2)
    items_favy_merch = create_list(:item, 5)
    items_favy_merch.each { |item| item.update_attribute(:merchant_id, merchant1.id) }
    other_merch_item = merchant2.items.create(name: "widget",
                                              description: "example",
                                              unit_price: 1)
    invoice1 = customer.invoices.create(status: "shipped", merchant_id: merchant1.id)
    invoice2 = customer.invoices.create(status: "shipped", merchant_id: merchant2.id)
    Transaction.create(credit_card_number: "123", result: "success", invoice_id: invoice1.id)
    Transaction.create(credit_card_number: "123", result: "success", invoice_id: invoice2.id)

    items_favy_merch.each do |item|
      InvoiceItem.create(quantity: 1,
                          unit_price: item.unit_price,
                          item_id: item.id,
                          invoice_id: invoice1.id)
    end
    InvoiceItem.create(quantity: 1,
                        unit_price: other_merch_item.unit_price,
                        item_id: other_merch_item.id,
                        invoice_id: invoice2.id)


    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    json = parse(response)

    expect(response).to be_success
    expect(json["id"]).to eq(merchant1.id)
    expect(json["name"]).to eq(merchant1.name)
  end
end

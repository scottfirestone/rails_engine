require "rails_helper"

RSpec.describe "Single merchant logic endpoint", :type => :request do
  it "returns total revenue for that merchant" do
    customer = create(:customer)
    merchant = create(:merchant)
    item     = create(:item)
    item.update_attribute(:merchant_id, merchant.id)
    invoice  = merchant.invoices.create(status: "shipped", customer_id: customer.id)
    Transaction.create(credit_card_number: "123", result: "success", invoice_id: invoice.id)
    InvoiceItem.create(quantity: 1,
                        unit_price: item.unit_price,
                        item_id: item.id,
                        invoice_id: invoice.id)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    json = parse(response)

    expect(response).to be_success
    expect(json["revenue"]).to eq("0.47")
  end
end

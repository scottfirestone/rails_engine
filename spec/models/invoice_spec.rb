require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it "should have db relationships" do
    should belong_to(:customer)
    should belong_to(:merchant)
    should have_many(:transactions)
    should have_many(:invoice_items)
    should have_many(:items)
  end
end

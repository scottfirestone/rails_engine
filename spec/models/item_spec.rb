require 'rails_helper'

RSpec.describe Item, type: :model do
  it "should have db relationships" do
    should have_many(:invoices)
    should have_many(:invoice_items)
    should belong_to(:merchant)
  end
end

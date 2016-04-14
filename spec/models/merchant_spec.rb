require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "should have db relationships" do
    should have_many(:items)
    should have_many(:invoices)
    should have_many(:customers)
    should have_many(:transactions)
  end
end

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "should have db relationships" do
    should have_many(:invoices)
    should have_many(:transactions)
    should have_many(:merchants)
  end
end

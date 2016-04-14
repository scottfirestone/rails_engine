require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "should have db relationships" do
    should belong_to(:invoice)
  end
end

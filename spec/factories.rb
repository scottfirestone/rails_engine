FactoryGirl.define do
  factory :transaction do
    credit_card_number "MyString"
    credit_card_expiration_date "MyString"
    result "MyString"
    invoice nil
  end
  factory :invoice_item do
    quantity 1
    unit_price 1
    item nil
    invoice nil
  end
  factory :item do
    name "MyString"
    description "MyString"
    unit_price 1
    merchant nil
  end
  factory :invoice do
    status "MyString"
    customer nil
    merchant nil
  end
  factory :merchant do
    name "MyString"
  end
  factory :customer do
    first_name "MyString"
    last_name "MyString"
  end
end
class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    customer = self.invoices.joins(:transactions).
      where(transactions: { result: "success" }).
      group(:merchant_id).
      order('count_id desc').
      count('id').
      first[0]
  end
end

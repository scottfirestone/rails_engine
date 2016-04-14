class Item < ActiveRecord::Base
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def best_day
   ranked_days = invoices.select('invoices.created_at')
     .joins(:transactions)
     .where(transactions: { result: "success" })
     .group(:created_at)
     .order('SUM(invoice_items.unit_price * invoice_items.quantity) DESC')
   { best_day: ranked_days.first.created_at }
 end
end

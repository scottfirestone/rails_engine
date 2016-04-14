class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_customer
    self.invoices.joins(:transactions).
      where(transactions: { result: "success" }).
      group(:customer_id).
      order('count_id desc').
      count('id').
      first[0]
  end

  def revenue
    unformatted = self.invoices.
      joins(:transactions, :invoice_items).
      where(transactions: { result: "success" }).
      sum("invoice_items.unit_price * invoice_items.quantity")
    formatted = '%.02f' % (unformatted / 100.0)
    { "revenue" => "#{formatted}"}
  end

  def revenue_by_date(date)
    unformatted = self.invoices.
      where(created_at: date).
      joins(:transactions, :invoice_items).
      where(transactions: { result: "success" }).
      sum("invoice_items.unit_price * invoice_items.quantity")
    formatted = '%.02f' % (unformatted / 100.0)
    { "revenue" => "#{formatted}"}
  end

#eager loading for customers??
  def customers_with_pending_invoices
    invoices = self.invoices.
      joins(:transactions).
      where(transactions: { result: "failed" })

    invoices.map do |invoice|
      invoice.customer
    end.uniq
  end
end

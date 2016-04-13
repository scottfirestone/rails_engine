class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def revenue
    unformatted = self.invoices.
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

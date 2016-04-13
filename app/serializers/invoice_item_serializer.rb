class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity,  :unit_price, :item_id, :invoice_id, :created_at, :updated_at

  def unit_price
    '%.02f' % (object.unit_price / 100.0)
  end
end

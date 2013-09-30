require "sales_engine"
require "invoice_item_repo"
require "csv"

class InvoiceItem

  attr_reader :id,
              :item_id, 
              :invoice_id, 
              :quantity, 
              :unit_price, 
              :created_at, 
              :updated_at

  def initialize(attribute = {})
    @id              = attribute[:id]
    @item_id         = attribute[:item_id]
    @invoice_id      = attribute[:invoice_id]
    @quantity        = attribute[:quantity]
    @unit_price      = attribute[:unit_price]
    @created_at      = attribute[:created_at]
    @updated_at      = attribute[:updated_at]
  end

  def invoice
    engine = SalesEngine.new
    invoices = engine.invoice_repository.all
    invoices.find do |invoice|
      invoice.id == self.invoice_id
      invoice
    end
  end

  def item
    engine = SalesEngine.new
    items = engine.item_repository.all
    items.find do |item|
      item.id == self.item_id
      item
    end
  end

end

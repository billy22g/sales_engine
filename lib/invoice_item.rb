
class InvoiceItem

  attr_reader :id,
              :item_id, 
              :invoice_id, 
              :quantity, 
              :unit_price, 
              :created_at, 
              :updated_at,
              :engine

  def initialize(attribute = {}, engine = SalesEngine.new)
    @id              = attribute[:id].to_i
    @item_id         = attribute[:item_id].to_i
    @invoice_id      = attribute[:invoice_id].to_i
    @quantity        = attribute[:quantity].to_i
    @unit_price      = attribute[:unit_price].to_i
    @created_at      = attribute[:created_at]
    @updated_at      = attribute[:updated_at]
    @engine          = engine
  end

  def invoice
    engine.invoice_repository.find_by_id(invoice_id)
  end

  def item
    engine.item_repository.find_by_id(item_id)
  end

  def total
    quantity*unit_price
  end

end

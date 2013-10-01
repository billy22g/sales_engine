
class Merchant

attr_reader :id, 
            :name, 
            :created_at, 
            :updated_at,
            :engine
            

  def initialize(attribute = {}, engine = SalesEngine.new)
    @id = attribute[:id]
    @name = attribute[:name]
    @created_at = attribute[:created_at]
    @updated_at = attribute[:updated_at]
    @engine = engine
  end

  def items
    items = engine.item_repository.all
    items.find_all do |item|
      item.merchant_id == id
    end
  end

  def invoices
    invoices = engine.invoice_repository.all
    invoices.find_all do |invoice|
      invoice.merchant_id == id
    end
  end

end

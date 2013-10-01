
class Merchant

attr_reader :id, 
            :name, 
            :created_at, 
            :updated_at,
            :engine
            

  def initialize(attribute = {}, engine = SalesEngine.new)
    @id         = attribute[:id].to_i
    @name       = attribute[:name]
    @created_at = attribute[:created_at]
    @updated_at = attribute[:updated_at]
    @engine     = engine
  end

  def items
    items = engine.item_repository.all
    items.select do |item|
      item.merchant_id == id
    end
  end

  def invoices
    invoices = engine.invoice_repository.all
    invoices.select do |invoice|
      invoice.merchant_id == id
    end
  end

  def revenue
    invoices.collect do |invoice|
      invoice.transactions
    end
  end

end

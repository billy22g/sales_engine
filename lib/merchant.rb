
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
    engine.item_repository.find_all_by_merchant_id(id)
  end

  def invoices
    engine.invoice_repository.find_all_by_merchant_id(id)
  end

  def revenue
    invoices.collect do |invoice|
      invoice.transactions
    end
  end

end

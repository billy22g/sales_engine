
class Item
  attr_reader :id, 
              :name, 
              :description,
              :unit_price, 
              :merchant_id,                
              :created_at, 
              :updated_at,   
              :engine

  def initialize(attribute = {}, engine = SalesEngine.new)
    @id                = attribute[:id]                                    
    @name              = attribute[:name]                            
    @description       = attribute[:description]  
    @unit_price        = attribute[:unit_price]    
    @merchant_id       = attribute[:merchant_id]  
    @created_at        = attribute[:created_at]    
    @updated_at        = attribute[:updated_at] 
    @engine            = engine    
  end

  def invoice_items
    invoice_items = engine.invoice_item_repository.all
    invoice_items.select do |invoice_item|
      invoice_item.item_id == id
    end
  end

  def merchant
    merchants = engine.merchant_repository.all
    merchants.find do |merchant|
      merchant.id == merchant_id
    end
  end

end

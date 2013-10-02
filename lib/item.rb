
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
    @id                = attribute[:id].to_i                                  
    @name              = attribute[:name]                            
    @description       = attribute[:description]  
    @unit_price        = attribute[:unit_price].to_i    
    @merchant_id       = attribute[:merchant_id].to_i  
    @created_at        = attribute[:created_at]    
    @updated_at        = attribute[:updated_at] 
    @engine            = engine    
  end

  def invoice_items
    engine.invoice_item_repository.find_all_by_item_id(id)
  end

  def merchant
    engine.merchant_repository.find_by_id(merchant_id)
  end

end

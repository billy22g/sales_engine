require "csv"

class Item
  attr_reader :id, 
              :name, 
              :description,
              :unit_price, 
              :merchant_id,                
              :created_at, 
              :updated_at   

  def initialize(attribute = {})
    @id          = attribute[:id]                                    
    @name        = attribute[:name]                            
    @description = attribute[:description]  
    @unit_price  = attribute[:unit_price]    
    @merchant_id = attribute[:merchant_id]  
    @created_at  = attribute[:created_at]    
    @updated_at  = attribute[:updated_at]    
  end

end

require "csv"
class Item
  attr_reader :item_id, :item_name, :item_description,
              :item_unit_price, :item_merchant_id,                
              :item_created_at, :item_updated_at                              
  def initialize(attribute)
    @item_id          = attribute[:id]                                    
    @item_name        = attribute[:name]                            
    @item_description = attribute[:description]  
    @item_unit_price  = attribute[:unit_price]    
    @item_merchant_id = attribute[:merchant_id]  
    @item_created_at  = attribute[:created_at]    
    @item_updated_at  = attribute[:updated_at]    
  end

end

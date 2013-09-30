require "sales_engine"
require "item_repo"
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

  def invoice_items
    engine = SalesEngine.new
    invoice_items = engine.invoice_item_repository.all
    invoice_items.find_by_all do |invoice_item|
      invoice_item.item_id == self.id
    end
  end

  def merchant
    merchant = Merchant.new
  end

end

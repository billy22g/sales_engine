class Merchant

attr_reader :id, 
            :name, 
            :created_at, 
            :updated_at
            

  def initialize (attribute = {})
    @id = attribute[:id]
    @name = attribute[:name]
    @created_at = attribute[:created_at]
    @updated_at = attribute[:updated_at]
  end

  def items
    engine = SalesEngine.new
    items = engine.item_repository
    items.find_all do |item|
      item.merchant_id == self.id
    end
  end

end

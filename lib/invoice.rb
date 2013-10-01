
class Invoice
  attr_reader :id, 
              :customer_id, 
              :merchant_id,
              :status,                
              :created_at, 
              :updated_at,
              :engine

  def initialize(attribute = {}, engine = SalesEngine.new)
    @id                  = attribute[:id]                                    
    @customer_id         = attribute[:customer_id]                            
    @merchant_id         = attribute[:merchant_id] 
    @status              = attribute[:status]                                   
    @created_at          = attribute[:created_at]    
    @updated_at          = attribute[:updated_at]
    @engine              = engine    
  end

  def transactions
    transactions = engine.transaction_repository.all
    transactions.select do |transaction|
      transaction.invoice_id == self.id
    end
  end

  def invoice_items
    invoice_items = engine.invoice_item_repository.all
    invoice_items.select do |invoice_item|
      invoice_item.invoice_id == id
    end
  end

  def items                      
    items = engine.item_repository.all
    items.select do |item|
      invoice_items.select do |invoice_item|
      item.id == invoice_item.item_id
    end
    end    
  end

  def customer
    customers = engine.customer_repository.all
    customers.find do |customer|
      customer.id == self.customer_id
      customer
    end 
  end

  def merchant
    merchants = engine.merchant_repository.all
    merchants.find do |merchant|
      merchant.id == self.merchant_id
      merchant
    end
  end

end

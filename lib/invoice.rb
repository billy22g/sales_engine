
class Invoice
  attr_reader :id, 
              :customer_id, 
              :merchant_id,
              :status,                
              :created_at, 
              :updated_at,
              :engine

  def initialize(attribute = {}, engine = SalesEngine.new)
    @id                  = attribute[:id].to_i                                  
    @customer_id         = attribute[:customer_id].to_i                            
    @merchant_id         = attribute[:merchant_id].to_i 
    @status              = attribute[:status]                                   
    @created_at          = attribute[:created_at]    
    @updated_at          = attribute[:updated_at]
    @engine              = engine    
  end

  def transactions
    transactions = engine.transaction_repository.all
    transactions.select do |transaction|
      transaction.invoice_id == id
    end
  end

  def invoice_items
    invoice_items = engine.invoice_item_repository.all
    invoice_items.select do |invoice_item|
      invoice_item.invoice_id == id
    end
  end

  def items                      
    invoice_items.collect do |invoice_item|
      invoice_item.item
    end
  end

  def customer
    customers = engine.customer_repository.all
    customers.find do |customer|
      customer.id == customer_id
    end 
  end

  def merchant
    merchants = engine.merchant_repository.all
    merchants.find do |merchant|
      merchant.id == merchant_id
    end
  end

end

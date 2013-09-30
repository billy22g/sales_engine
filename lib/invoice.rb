require "sales_engine"
require "invoice_repo"
require "csv"

class Invoice
  attr_reader :id, 
              :customer_id, 
              :merchant_id,
              :status,                
              :created_at, 
              :updated_at 

  def initialize(attribute = {})
    @id                  = attribute[:id]                                    
    @customer_id         = attribute[:customer_id]                            
    @merchant_id         = attribute[:merchant_id] 
    @status              = attribute[:status]                                   
    @created_at          = attribute[:created_at]    
    @updated_at          = attribute[:updated_at]    
  end

  def transactions
    engine = SalesEngine.new
    transactions = engine.transaction_repository.all
    transactions.find_by_all do |transaction|
      transaction.invoice_id == self.id
    end
  end

  def invoice_items
    engine = SalesEngine.new
    invoice_items = engine.invoice_item_repository.all
    invoice_items.find_by_all do |invoice_item|
      invoice_item.invoice_id == self.id
    end
  end

  def customer
    engine = SalesEngine.new
    customers = engine.customer_repository.all
    customers.find do |customer|
      customer.id == self.customer_id
      customer
    end 
  end

  def merchant
    engine = SalesEngine.new
    merchants = engine.merchant_repository.all
    merchants.find do |merchant|
      merchant.id == self.merchant_id
      merchant
    end
  end

end

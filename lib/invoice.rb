require "csv"

class Invoice
  attr_reader :id, 
              :customer_id, 
              :merchant_id,
              :status,                
              :created_at, 
              :updated_at 

  def initialize(attribute)
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

end

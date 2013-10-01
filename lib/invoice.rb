
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

  def successful?
    transactions.result == "success" 
  end

  def successful_invoices
    if successful? == true
      si = [] << Invoice
    end
  end

  def total
    totals = invoice_items.collect do |invoice_item|
      invoice_item.total
    end
    totals.reduce(:+)
  end

  def invoice_items
    engine.invoice_item_repository.find_all_by_invoice_id(id)
  end

  def items                      
    invoice_items.collect do |invoice_item|
      invoice_item.item
    end
  end

  def customer
    engine.customer_repository.find_by_id( customer_id )
  end

  def merchant
    engine.merchant_repository.find_by_id( merchant_id)
  end

end

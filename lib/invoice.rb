require "csv"
class Invoice
  attr_reader :invoice_id, :invoice_customer_id, :invoice_merchant_id,
              :invoice_status, :invoice_merchant_id,                
              :invoice_created_at, :invoice_updated_at                              
  def initialize(attribute)
    @invoice_id          = attribute[:id]                                    
    @invoice_customer_id = attribute[:customer_id]                            
    @invoice_merchant_id = attribute[:merchant_id] 
    @invoice_status      = attribute[:status]                                   
    @invoice_created_at  = attribute[:created_at]    
    @invoice_updated_at  = attribute[:updated_at]    
  end

end

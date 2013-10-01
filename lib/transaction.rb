
class Transaction

attr_reader   :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at,
              :engine

  def initialize(attribute = {}, engine = SalesEngine.new)
    @id                          = attribute[:id].to_i
    @invoice_id                  = attribute[:invoice_id].to_i
    @credit_card_number          = attribute[:credit_card_number]
    @credit_card_expiration_date = attribute[:credit_card_expiration_date]
    @result                      = attribute[:result]
    @created_at                  = attribute[:created_at]
    @updated_at                  = attribute[:updated_at]
    @engine                      = engine
  end

  def invoice
    invoices = engine.invoice_repository.all
    invoices.select do |invoice|
      invoice.id == invoice_id
    end
  end
  
end

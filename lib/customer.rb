
class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :engine

  def initialize(attribute = {}, engine = SalesEngine.new)
    @id          = attribute[:id].to_i
    @first_name  = attribute[:first_name]
    @last_name   = attribute[:last_name]
    @created_at  = attribute[:created_at]
    @updated_at  = attribute[:updated_at]
    @engine      = engine
  end

  def invoices
    engine.invoice_repository.find_all_by_customer_id(id)
  end

end

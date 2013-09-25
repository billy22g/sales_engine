class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(attribute)
    @id = attribute[:id]
    @first_name  = attribute[:first_name]
    @last_name   = attribute[:last_name]
    @created_at  = attribute[:created_at]
    @updated_at  = attribute[:updated_at]
  end

end

require 'csv'
require_relative 'merchant'
require_relative 'merchant_repo'
require_relative 'invoice'
require_relative 'invoice_repo'
require_relative 'item'
require_relative 'item_repo'
require_relative 'invoice_item'
require_relative 'invoice_item_repo'
require_relative 'customer'
require_relative 'customer_repo'
require_relative 'transaction'
require_relative 'transaction_repo'


class SalesEngine
  attr_reader   :merchant_repository,
                :invoice_repository,                
                :item_repository,
                :invoice_item_repository,
                :customer_repository,
                :transaction_repository

  def initialize
    @merchant_repository = MerchantRepo.new(nil, self)
    @invoice_repository = InvoiceRepo.new(nil, self)
    @item_repository = ItemRepo.new(nil, self)
    @invoice_item_repository = InvoiceItemRepo.new(nil, self)
    @customer_repository = CustomerRepo.new(nil, self)
    @transaction_repository = TransactionRepo.new(nil, self)
  end

end


  

# engine = SalesEngine.new
# engine.startup

# engine.merchant_repository
# engine.invoice_repository
# engine.item_repository
# engine.invoice_item_repository
# engine.customer_repository
# engine.transactions_repository

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
    @merchant_repository = MerchantRepo.new
    @invoice_repository = InvoiceRepo.new 
    @item_repository = ItemRepo.new
    @invoice_item_repository = InvoiceItemRepo.new
    @customer_repository = CustomerRepo.new
    @transaction_repository = TransactionRepo.new
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

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant'
require_relative '../lib/invoice'
require_relative '../lib/item'
require_relative '../lib/invoice_item'
require_relative '../lib/customer'
require_relative '../lib/transaction'
require_relative '../lib/merchant_repo'
require_relative '../lib/invoice_repo'
require_relative '../lib/item_repo'
require_relative '../lib/invoice_item_repo'
require_relative '../lib/customer_repo'
require_relative '../lib/transaction_repo'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test 
  def setup
    @engine = SalesEngine.new
  end

end

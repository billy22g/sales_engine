require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer.rb'
require './lib/sales_engine'
require 'csv'

class CustomerTest < MiniTest::Test 

  def contents
    CSV.read './data/customers.csv', headers: true, header_converters: :symbol
  end

  def customer
    Customer.new(contents.first)
  end
  def test_customer_id
    assert_equal 1, customer.id
  end
  def test_customer_first_name
    assert_equal "Joey", customer.first_name
  end
  def test_customer_last_name
    assert_equal "Ondricka", customer.last_name
  end
  def test_created_at
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
  end
  def test_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end
  def test_that_invoice_method_returns_instance_of_Invoice_associated_with_the_customer
    customer = Customer.new
    assert_kind_of Array, customer.invoices
  end
end

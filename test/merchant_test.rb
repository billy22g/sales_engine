gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant"
require "./lib/sales_engine"
require "csv"

class MerchantTest < Minitest::Test

  def contents
    CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def merchant
    Merchant.new(contents.first)
  end

  def test_merchant_id
    assert_equal 1, merchant.id
  end

  def test_merchant_name
    assert_equal "Schroeder-Jerde", merchant.name
  end  

  def test_merchant_created_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_merchant_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end

  def test_that_a_merchant_can_find_its_items
    merchant = Merchant.new(:id => "1")
    assert_equal 5, merchant.items.count
  end

  def test_that_a_merchant_can_find_its_invoices
    merchant = Merchant.new(:id => "26")
    assert_equal 1, merchant.invoices.count
  end

end


gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant"
require "./lib/sales_engine"
require "csv"

class MerchantTest < Minitest::Test

  def contents
    contents = CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def merchant_attributes
    contents.each do |row|
      id = row[:id]
      name = row[:name]
      created_at = row[:created_at]
      updated_at = row[:updated_at]
    end

  end

  def merchant
    merchant = Merchant.new(merchant_attributes)
  end

  def test_merchant_id
    assert_equal merchant_attributes[:id], merchant.id
  end

  def test_merchant_name
    assert_equal merchant_attributes[:name], merchant.name
  end  

  def test_merchant_created_at
    assert_equal merchant_attributes[:created_at], merchant.created_at
  end

  def test_merchant_updated_at
    assert_equal merchant_attributes[:updated_at], merchant.updated_at
  end

  def test_that_a_merchant_can_find_its_items
    engine = SalesEngine.new
    items = engine.item_repository.find_all_by_merchant_id("1")
    assert_equal 5, items.count
  end

  def test_that_a_merchant_can_find_its_invoices
    engine = SalesEngine.new
    invoices = engine.invoice_repository.find_all_by_merchant_id("33")
    assert_equal 1, invoices.count
  end

end


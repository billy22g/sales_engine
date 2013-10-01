require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/item"
require "./lib/sales_engine"
require "csv"

class ItemsTest < MiniTest::Test
  def contents
    CSV.read "./data/items.csv", headers: true, header_converters: :symbol
  end

  def item
    Item.new(contents.first)
  end

  def test_it_gets_item_id
    assert_equal "1", item.id
  end

  def test_it_gets_name
    assert_equal "1", item.name
  end

  def test_it_gets_description
    assert_equal "1", item.description
  end

  def test_it_gets_unit_price
    assert_equal "1", item.unit_price
  end

  def test_it_gets_merchant_id
    assert_equal "1", item.merchant_id
  end

  def test_it_gets_created_at
    assert_equal "1", item.created_at
  end

  def test_it_gets_updated_at
    assert_equal "1", item.updated_at
  end

  def test_invoice_items_method_returns_associated_invoice_items
    engine = SalesEngine.new
    invoice_items = engine.invoice_item_repository.find_all_by_quantity("7")
    assert_equal 1, invoice_items.count
  end

  def test_merchant_method_returns_a_Merchant
    item = Item.new
    assert_kind_of Merchant, item.merchant
  end

end

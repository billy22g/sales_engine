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
    assert_equal 1, item.id
  end

  def test_it_gets_name
    assert_equal "Item Qui Esse", item.name
  end

  def test_it_gets_description
    assert_equal "Nihil autem sit ", item.description
  end

  def test_it_gets_unit_price
    assert_equal 75107, item.unit_price
  end

  def test_it_gets_merchant_id
    assert_equal 1, item.merchant_id
  end

  def test_it_gets_created_at
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_it_gets_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

  def test_invoice_items_method_returns_associated_invoice_items
    item = Item.new(:id => "1")
    assert_equal 1, item.invoice_items.count
  end

  def test_merchant_method_returns_a_Merchant
    item = Item.new(:merchant_id => "1")
    assert_kind_of Merchant, item.merchant
  end

end

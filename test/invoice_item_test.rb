require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item'
require './lib/sales_engine'
require 'csv'


class InvoiceItemTest < MiniTest::Test 

  def contents
    CSV.read "./data/invoice_items.csv", headers: true, header_converters: :symbol
  end

  def invoice_items
    InvoiceItem.new(contents.first)
  end

  def test_invoice_items_id
    assert_equal "1", invoice_items.id
  end

  def test_item_id
    assert_equal "539", invoice_items.item_id
  end

  def test_invoice_id
    assert_equal "1", invoice_items.invoice_id
  end

  def test_quantity
    assert_equal "5", invoice_items.quantity
  end

  def test_unit_price
    assert_equal "13635", invoice_items.unit_price
  end

  def test_created_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.updated_at
  end

  def test_that_invoice_method_returns_an_instance_of_Invoice
    invoice_item = InvoiceItem.new
    assert_kind_of Invoice, invoice_item.invoice
  end

  def test_that_item_method_returns_an_instance_of_Item
    invoice_item = InvoiceItem.new
    assert_kind_of Item, invoice_item.item
  end
  
end

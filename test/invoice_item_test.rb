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

  def invoice_item
    InvoiceItem.new(contents.first)
  end

  def test_invoice_items_id
    assert_equal 1, invoice_item.id
  end

  def test_item_id
    assert_equal 1, invoice_item.item_id
  end

  def test_invoice_id
    assert_equal 1, invoice_item.invoice_id
  end

  def test_quantity
    assert_equal 5, invoice_item.quantity
  end

  def test_unit_price
    assert_equal 13635, invoice_item.unit_price
  end

  def test_created_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end

  def test_that_invoice_method_returns_an_instance_of_Invoice
    invoice_item = InvoiceItem.new(:invoice_id => "1")
    assert_kind_of Invoice, invoice_item.invoice
  end

  def test_that_item_method_returns_an_instance_of_Item
    assert_kind_of Item, invoice_item.item
    assert_equal 1, invoice_item.item_id
  end
  
end

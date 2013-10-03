require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice"
require "./lib/sales_engine"
require "csv"

class InvoiceTest < MiniTest::Test
  def contents
    CSV.read "./data/invoices.csv", headers: true, header_converters: :symbol
  end

  def invoice
    Invoice.new(contents.first)
  end

  def test_it_gets_item_id
    assert_equal 1, invoice.id
  end

  def test_it_gets_customer_id
    assert_equal 1, invoice.customer_id
  end

  def test_it_gets_unit_price
    assert_equal "shipped", invoice.status
  end

  def test_it_gets_merchant_id
    assert_equal 26, invoice.merchant_id
  end

  def test_it_gets_created_at
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
  end

  def test_it_gets_updated_at
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
  end

  def test_that_invoices_can_find_their_associated_transactions
    invoice = Invoice.new(:id => "1")
    assert_equal 4, invoice.transactions.count
  end

  def test_that_invoices_can_find_their_associated_invoice_items
    invoice = Invoice.new(:id => "1")
    assert_equal 4, invoice.invoice_items.count
  end

  def test_that_invoices_can_return_their_associated_items
    invoice = Invoice.new(:id => "1")
    assert_equal 4, invoice.items.count
  end

  def test_that_customer_method_returns_instance_of_Customer_associated_with_the_invoice
    assert_kind_of Customer, invoice.customer
  end

  def test_that_merchant_method_returns_instance_of_Merchant_associated_with_the_invoice
    assert_equal 26, invoice.merchant_id
  end

  def test_for_total_of_an_invoice
    assert_equal 563663, invoice.total
  end

  def test_for_successful_transactions_by_invoice_id
    invoice = Invoice.new(:id => 1)
    assert_equal 4, invoice.successful_transactions.count
  end

end

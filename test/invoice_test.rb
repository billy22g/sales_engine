require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice"
require "./lib/sales_engine"
require "csv"

class InvoiceTest < MiniTest::Test
  def contents
    contents = CSV.read "./data/invoices.csv", headers: true, header_converters: :symbol
  end

  def invoice_attributes
    contents.each do |attribute|
      id          = attribute[:id]       
      customer_id = attribute[:customer_id]       
      merchant_id = attribute[:merchant_id]
      status      = attribute[:status]
      created_at  = attribute[:created_at] 
      updated_at  = attribute[:updated_at] 
    end
  end

  def invoice
    @invoice ||= Invoice.new(invoice_attributes)
  end

  def test_it_gets_item_id
    assert_equal invoice_attributes[:id], invoice.id
  end

  def test_it_gets_customer_id
    assert_equal invoice_attributes[:customer_id], invoice.customer_id
  end

  def test_it_gets_unit_price
    assert_equal invoice_attributes[:status], invoice.status
  end

  def test_it_gets_merchant_id
    assert_equal invoice_attributes[:merchant_id], invoice.merchant_id
  end

  def test_it_gets_created_at
    assert_equal invoice_attributes[:created_at], invoice.created_at
  end

  def test_it_gets_updated_at
    assert_equal invoice_attributes[:updated_at], invoice.updated_at
  end

  def test_that_invoices_can_find_their_associated_transactions
    engine = SalesEngine.new
    transactions = engine.transaction_repository.find_all_by_invoice_id("6")
    assert_equal 1, transactions.count
  end

  def test_that_invoices_can_find_their_associated_invoice_items
    engine = SalesEngine.new
    invoice_items = engine.invoice_item_repository.find_all_by_item_id("539")
    assert_equal 2, invoice_items.count
  end

  def test_that_invoices_can_return_their_associated_items
    engine = SalesEngine.new
    items = engine.item_repository.find_all_by_name("Item Qui Esse")
    assert_equal 1, items.count
  end

  def test_that_customer_method_returns_instance_of_Customer_associated_with_the_invoice
    invoice = Invoice.new
    assert_kind_of Customer, invoice.customer
  end

  def test_that_merchant_method_returns_instance_of_Merchant_associated_with_the_invoice
    invoice = Invoice.new
    assert_kind_of Merchant, invoice.merchant
  end




end

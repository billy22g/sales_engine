require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction'
require './lib/sales_engine'
require 'csv'

class TransactionTest < MiniTest::Test  

  def contents
    CSV.read "./data/transactions.csv", headers: true, header_converters: :symbol
  end 

  def transaction
    Transaction.new(contents.first)
  end

  def test_transaction_id
    assert_equal "1", transaction.id
  end

  def test_invoice_id
    assert_equal "1", transaction.invoice_id
  end

  def test_credit_card_number
    assert_equal "4.65E+15", transaction.credit_card_number
  end

  def test_credit_card_expiration_date
    assert_equal nil, transaction.credit_card_expiration_date
  end

  def test_result
    assert_equal "success", transaction.result
  end

  def test_created_at
    assert_equal "2012-03-27 14:54:09 UTC", transaction.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", transaction.updated_at
  end

  

end  


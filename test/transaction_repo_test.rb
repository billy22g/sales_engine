gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/transaction_repo"
require "csv"

class TransactionRepoTest < Minitest::Test 

  def repo
    TransactionRepo.new("./data/transactions.csv")
  end

  def test_it_receives_filename_that_will_be_loaded_by_default
    assert_equal "./data/transactions.csv", TransactionRepo.new.filename
  end

  def test_it_reads_file
    loaded_data = CSV.read "./data/transactions.csv", headers: true, header_converters: :symbol
    assert_equal loaded_data, repo.read_file
  end

  def test_that_transaction_objects_method_actually_creates_new_transaction_objects
    transaction = repo.transaction_objects
    assert_equal 5, transaction.last.id
    assert_equal "2012-03-28 14:54:10 UTC", transaction.last.created_at
  end

  def test_that_it_finds_one_transaction_by_attribute
    transaction = repo.find_by_updated_at("2012-03-30 14:54:10 UTC")
    assert_equal 5, transaction.id
  end

  def test_that_it_finds_all_transactions_by_attribute
    transaction = repo.find_all_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal 2, transaction.length
  end

  def test_that_random_method_returns_a_random_transaction
    results = []
    10.times{ results << repo.random }
    assert results.uniq.count > 1
  end

end

gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/customer_repo"
require "./lib/sales_engine"
require "csv"

class CustomerRepoTest < Minitest::Test 

  def repo
   CustomerRepo.new("./data/customers.csv")
  end

  def test_it_receives_filename_that_will_be_loaded_by_default
    assert_equal "./data/customers.csv", CustomerRepo.new.filename
  end

  def test_it_reads_file
    loaded_data = CSV.read "./data/customers.csv", headers: true, header_converters: :symbol
    assert_equal loaded_data, repo.read_file
  end

  def test_that_customer_objects_method_actually_creates_new_customer_objects
    customer = repo.customer_objects
    assert_equal "1", customer.first.id
    assert_equal "5", customer.last.id
  end

  def test_that_it_finds_one_customer_by_attribute
    customer = repo.find_by_first_name("Cecelia")
    assert_equal "2", customer.id
  end

  def test_that_it_finds_all_customer_by_attribute
    customer = repo.find_all_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal 4, customer.length
  end

  def test_that_random_method_returns_a_random_customer
    results = []
    10.times{ results << repo.random }
    assert results.uniq.count > 1
  end
end

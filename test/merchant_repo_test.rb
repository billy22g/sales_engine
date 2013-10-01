gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant_repo"
require "csv"

class MerchantRepoTest < Minitest::Test 

  def repo
    MerchantRepo.new("./data/merchants.csv")
  end

  def test_it_receives_filename_that_will_be_loaded_by_default
    assert_equal "./data/merchants.csv", MerchantRepo.new.filename
  end

  def test_it_reads_file
    loaded_data = CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
    assert_equal loaded_data, repo.read_file
  end

  def test_that_merchant_objects_method_actually_creates_new_merchant_objects
    merchant = repo.merchant_objects
    assert_equal 5, merchant.last.id
    assert_equal "Williamson Group", merchant.last.name
  end

  def test_that_it_finds_one_merchant_by_attribute
    merchant = repo.find_by_name("Williamson Group")
    assert_equal 5, merchant.id
  end

  def test_that_it_finds_all_merchants_by_attribute
    merchant = repo.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 5, merchant.length
  end

  def test_that_random_method_returns_a_random_merchant
    results = []
    10.times{ results << repo.random }
    assert results.uniq.count > 1
  end

end

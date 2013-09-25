gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/merchant_repo"
require "csv"

class MerchantRepoTest < Minitest::Test 

  def repo
    @mr ||= MerchantRepo.new("./data/merchants.csv")
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
    assert_equal "5", merchant.last.merchant_id
    assert_equal "Williamson Group", merchant.last.merchant_name
  end

  def test_that_it_finds_one_merchant_by_attribute
    merchant = repo.find_by(:merchant_name, "Williamson Group")
    assert_equal "5", merchant.merchant_id
  end

  def test_that_it_finds_all_merchants_by_attribute
    merchant = repo.find_all_by(:merchant_created_at, "2012-03-27 14:53:59 UTC")
    assert_equal 5, merchant.length
  end

  def test_that_random_method_returns_a_random_merchant
    results = []
    10.times{ results << repo.random }
    assert results.uniq.count > 1
  end






  # def test_that_file_finds_expected_data_pieces
  #   filename = "./data/merchants.csv"
  #   mr = MerchantRepo.new(filename)
  #   merchant5 = mr.merchant_list[4]
  #   assert_equal "Williamson Group", mr.merchant5[:name]
  # end

  # def test_find_merchant_id
  #   mr = MerchantRepo.new("./data/merchants.csv")
  #   merchant_id = "1"
  #   mr.find_merchant_id(merchant_id)
  #   merchant = mr.search_results[0]
  #   assert_equal "1", merchant.merchant_id
  # end

  # def test_find_merchant_name
  #   mr = MerchantRepo.new("./data/merchants.csv")
  #   merchant_name = "Williamson Group"
  #   mr.find_merchant_name(merchant_name)
  #   merchant = mr.search_results[0]
  #   assert_equal "Williamson Group", merchant.merchant_name
  # end

  # def test_find_create_date
  #   mr = MerchantRepo.new("./data/merchants.csv")
  #   create_date = "2012-03-27 14:53:59 UTC"
  #   mr.find_create_date(create_date)
  #   merchant = mr.search_results[0]
  #   assert_equal "2012-03-27 14:53:59 UTC", merchant.merchant_created_at

  # end

  # def test_find_update_date
  #   skip
  #   mr = MerchantRepo.new("./data/merchants.csv")
  #   update_date = "2012-03-27 14:53:59 UTC"

  # end


end

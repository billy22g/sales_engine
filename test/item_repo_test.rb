gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/item_repo"
require "csv"

class ItemRepoTest < Minitest::Test 

  def repo
    ItemRepo.new("./data/items.csv")
  end

  def test_it_receives_filename_that_will_be_loaded_by_default
    assert_equal "./data/items.csv", ItemRepo.new.filename
  end

  def test_it_reads_file
    loaded_data = CSV.read "./data/items.csv", headers: true, header_converters: :symbol
    assert_equal loaded_data, repo.read_file
  end

  def test_that_item_objects_method_actually_creates_new_item_objects
    item = repo.item_objects
    assert_equal 5, item.last.id
    assert_equal "Item Expedita Aliquam", item.last.name
  end

  def test_that_it_finds_one_item_by_attribute
    item = repo.find_by_name("Item Autem Minima")
    assert_equal 2, item.id
  end

  def test_that_it_finds_all_item_by_attribute
    item = repo.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 5, item.length
  end

  def test_that_random_method_returns_a_random_item
    results = []
    10.times{ results << repo.random }
    assert results.uniq.count > 1
  end
end

gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice_items_repo"
require "csv"

class InvoiceItemsRepoTest < Minitest::Test 

  def repo
    @ii ||= InvoiceItemsRepo.new("./data/invoice_items.csv")
  end

  def test_it_receives_filename_that_will_be_loaded_by_default
    assert_equal "./data/invoice_items.csv", InvoiceItemsRepo.new.filename
  end

  def test_it_reads_file
    loaded_data = CSV.read "./data/invoice_items.csv", headers: true, header_converters: :symbol
    assert_equal loaded_data, repo.read_file
  end

  def test_that_invoice_items_objects_method_actually_creates_new_invoice_item_objects
    invoice_item = repo.invoice_items_objects
    assert_equal "5", invoice_item.last.id
    assert_equal "79140", invoice_item.last.unit_price
  end

  def test_that_it_finds_one_invoice_items_by_attribute
    invoice_item = repo.find_by_quantity("7")
    assert_equal "5", invoice_item.id
  end

  def test_that_it_finds_all_invoice_items_by_attribute
    invoice_item = repo.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 5, invoice_item.length
  end

  def test_that_random_method_returns_a_random_invoice_items
    results = []
    10.times{ results << repo.random }
    assert results.uniq.count > 1
  end

end

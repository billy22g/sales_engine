gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice_repo"
require "csv"

class InvoiceRepoTest < Minitest::Test 

  def repo
    @mr ||= InvoiceRepo.new("./data/invoices.csv")
  end

  def test_it_receives_filename_that_will_be_loaded_by_default
    assert_equal "./data/invoices.csv", InvoiceRepo.new.filename
  end

  def test_it_reads_file
    loaded_data = CSV.read "./data/invoices.csv", headers: true, header_converters: :symbol
    assert_equal loaded_data, repo.read_file
  end

  def test_that_invoice_objects_method_actually_creates_new_invoice_objects
    invoice = repo.invoice_objects
    assert_equal "5", invoice.last.id
    assert_equal "41", invoice.last.merchant_id
  end

  def test_that_it_finds_one_invoice_by_attribute
    invoice = repo.find_by_merchant_id("75")
    assert_equal "2", invoice.id
  end

  def test_that_it_finds_all_invoice_by_attribute
    invoice = repo.find_all_by_status("shipped")
    assert_equal 5, invoice.length
  end

  def test_that_random_method_returns_a_random_invoice
    results = []
    10.times{ results << repo.random }
    assert results.uniq.count > 1
  end
end

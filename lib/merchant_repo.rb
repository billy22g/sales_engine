require "csv"
require "./lib/merchant"
require "pry"

class MerchantRepo

  attr_reader :engine
  
  def initialize(filename = "./data/merchants.csv", engine = SalesEngine.new)
    @merchant_list = []
    @filename = filename
    @engine = engine
  end

  def read_file
    @merchant_data = CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def merchant_objects
    if @merchant_list.empty?
      read_file.each do |row|
        @merchant_list << Merchant.new(row, engine)
      end
    end
    return @merchant_list
  end

  def all
    merchant_objects
  end

  def filename
    @filename
  end

  def merchant_list
    @merchant_list
  end

  def random
    merchant_objects.sample
  end

  def find_by(attribute, input)
    merchant_objects.find do |m|
      m.send(attribute).downcase == input.downcase
    end
  end

  def find_by_name(input)
    find_by(:name, input)
  end

  def find_by_id(input)
    find_by(:id, input)
  end

  def find_by_created_at(input)
    find_by(:created_at, input)
  end

  def find_by_updated_at(input)
    find_by(:updated_at, input)
  end

  def find_all_by(attribute, input)
    merchant_objects.select do |merchant|
      merchant.send(attribute).downcase == input.downcase
    end
  end

  def find_all_by_name(input)
      find_all_by(:name, input)
  end

  def find_all_by_id(input)
    find_all_by(:id, input)
  end

  def find_all_by_created_at(input)
    find_all_by(:created_at, input)
  end
  
  def find_all_by_updated_at(input)
    find_all_by(:updated_at, input)
  end

end

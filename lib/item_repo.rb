require "csv"
require "./lib/item"
require "pry"

class ItemRepo
  
  def initialize(filename = "./data/items.csv", engine = SalesEngine.new)
    @item_list = []
    @filename = filename
  end

  def read_file
    @item_data = CSV.read "./data/items.csv", headers: true, header_converters: :symbol
  end

  def item_objects
    if @item_list.empty?
      read_file.each do |row|
        @item_list << Item.new(row)
      end
    end
    return @item_list
  end

  def all
    item_objects
  end

  def filename
    @filename
  end

  def item_list
    @item_list
  end

  def random
    @item_list.sample
  end

  def find_by(attribute, input)
    item_objects.find do |m|
      m.send(attribute).downcase == input.downcase
    end
  end

  def find_by_name(input)
    find_by(:name, input)
  end

  def find_by_id(input)
    find_by(:id, input)
  end

  def find_by_description(input)
    find_by(:description, input)
  end

  def find_by_unit_price(input)
    find_by(:unit_price, input)
  end

  def find_by_merchant_id(input)
    find_by(:merchant_id, input)
  end

  def find_by_created_at(input)
    find_by(:created_at, input)
  end

  def find_by_updated_at(input)
    find_by(:updated_at, input)
  end

  def find_all_by(attribute, input)
    item_objects.select do |item|
      item.send(attribute).downcase == input.downcase
    end
  end

  def find_all_by_name(input)
    find_all_by(:name, input)
  end

  def find_all_by_id(input)
    find_all_by(:id, input)
  end

  def find_all_by_description(input)
    find_all_by(:description, input)
  end

  def find_all_by_unit_price(input)
    find_all_by(:unit_price, input)
  end

  def find_all_by_merchant_id(input)
    find_all_by(:merchant_id, input)
  end

  def find_all_by_created_at(input)
    find_all_by(:created_at, input)
  end
  
  def find_all_by_updated_at(input)
    find_all_by(:updated_at, input)
  end

end

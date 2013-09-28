require "csv"
require "./lib/customer"
require "pry"

class CustomerRepo
  
  def initialize(filename = "./data/customers.csv")
    @customer_list = []
    @filename = filename
    customer_objects
  end

  def read_file
    @customer_data = CSV.read "./data/customers.csv", headers: true, header_converters: :symbol
  end

  def customer_objects
    if @customer_list.empty?
      read_file.each do |row|
        @customer_list << Customer.new(row)
      end
    end
    return @customer_list
  end

  def all
    customer_objects
  end

  def filename
    @filename
  end

  def customer_list
    @customer_list
  end

  def random
    @customer_list.sample
  end

  def find_by(attribute, input)
    customer_objects.find do |m|
      m.send(attribute).downcase == input.downcase
    end
  end

  def find_by_id(input)
    find_by(:id, input)
  end

  def find_by_first_name(input)
    find_by(:first_name, input)
  end

  def find_by_last_name(input)
    find_by(:last_name, input)
  end

  def find_by_created_at(input)
    find_by(:created_at, input)
  end

  def find_by_updated_at(input)
    find_by(:updated_at, input)
  end

  def find_all_by(attribute, input)
    customer_objects.select do |customer|
      customer.send(attribute).downcase == input.downcase
    end
  end

  def find_all_by_id(input)
    find_all_by(:id, input)
  end

  def find_all_by_first_name(input)
    find_all_by(:first_name, input)
  end

  def find_all_by_last_name(input)
    find_all_by(:last_name, input)
  end

  def find_all_by_created_at(input)
    find_all_by(:created_at, input)
  end

  def find_all_by_updated_at(input)
    find_all_by(:updated_at, input)
  end
end

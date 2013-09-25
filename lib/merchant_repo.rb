require "csv"
require "./lib/merchant"
require "pry"

class MerchantRepo
  
  def initialize(filename = "./data/merchants.csv")
    @merchant_list = []
    @filename = filename
    merchant_objects
  end

  def read_file
    @merchant_data = CSV.read "./data/merchants.csv", headers: true, header_converters: :symbol
  end

  def merchant_objects
    if @merchant_list.empty?
      read_file.each do |row|
        @merchant_list << Merchant.new(row)
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

  def find_by(attribute, input)
    merchant_objects.find do |merchant|
      if attribute == :merchant_name && merchant.merchant_name.downcase == input.downcase
        merchant
      elsif attribute == :merchant_id && merchant.merchant_id.downcase == input.downcase
        merchant
      elsif attribute == :merchant_created_at && merchant.merchant_created_at.downcase == input.downcase
        merchant 
      elsif attribute == :merchant_updated_at && merchant.merchant_updated_at.downcase == input.downcase
        merchant
      end
    end
  end

  def find_all_by(attribute, input)
    merchant_objects.select do |merchant|
      if attribute == :merchant_name && merchant.merchant_name.downcase == input.downcase
        merchant
      elsif attribute == :merchant_id && merchant.merchant_id.downcase == input.downcase
        merchant
      elsif attribute == :merchant_created_at && merchant.merchant_created_at.downcase == input.downcase
        merchant 
      elsif attribute == :merchant_updated_at && merchant.merchant_created_at.downcase == input.downcase
        merchant
      end      
    end
  end

  def random
    @merchant_list.sample
  end

end

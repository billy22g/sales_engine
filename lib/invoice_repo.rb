

class InvoiceRepo

  attr_reader :engine 
  
  def initialize(filename = "./data/invoices.csv", engine = SalesEngine.new)

    @filename = filename
    @engine = engine
  end

  def read_file
    CSV.read "./data/invoices.csv", headers: true, header_converters: :symbol
  end

  def invoice_objects
    if @invoice_list.empty?
      read_file.each do |row|
        @invoice_list << Invoice.new(row, engine)
      end
    end
    return @invoice_list
  end

  def all
    @invoice_objects ||= invoice_objects
  end

  def filename
    @filename
  end

  def invoice_list
    @invoice_list
  end

  def random
    invoice_objects.sample
  end

  def find_by(attribute, input)
    invoice_objects.find do |m|
      m.send(attribute).to_s.downcase == input.to_s.downcase
    end
  end

  def find_by_id(input)
    find_by(:id, input)
  end

  def find_by_customer_id(input)
    find_by(:customer_id, input)
  end

  def find_by_merchant_id(input)
    find_by(:merchant_id, input)
  end

  def find_by_status(input)
    find_by(:status, input)
  end

  def find_by_created_at(input)
    find_by(:created_at, input)
  end

  def find_by_updated_at(input)
    find_by(:updated_at, input)
  end

  def find_all_by(attribute, input)
    invoice_objects.select do |invoice|
      invoice.send(attribute).to_s.downcase == input.to_s.downcase
    end
  end

  def find_all_by_id(input)
    find_all_by(:id, input)
  end

  def find_all_by_customer_id(input)
    find_all_by(:customer_id, input)
  end

  def find_all_by_merchant_id(input)
    find_all_by(:merchant_id, input)
  end

  def find_all_by_status(input)
    find_all_by(:status, input)
  end

  def find_all_by_created_at(input)
    find_all_by(:created_at, input)
  end
  
  def find_all_by_updated_at(input)
    find_all_by(:updated_at, input)
  end

end

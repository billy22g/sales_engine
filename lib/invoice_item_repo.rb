

class InvoiceItemRepo

  attr_reader :engine
  
  def initialize(filename = "./data/invoice_items.csv", engine = SalesEngine.new)
    @invoice_items_list = []
    @filename = filename
    @engine = engine 
  end

  def read_file
    CSV.read "./data/invoice_items.csv", headers: true, header_converters: :symbol
  end

  def invoice_items_objects
    if @invoice_items_list.empty?
      read_file.each do |row|
        @invoice_items_list << InvoiceItem.new(row, engine)
      end
    end
    return @invoice_items_list
  end

  def all
    invoice_items_objects
  end

  def filename
    @filename
  end

  def invoice_items_list
    @invoice_items_list
  end

  def random
    invoice_items_objects.sample
  end

  def find_by(attribute, input)
    invoice_items_objects.find do |m|
      m.send(attribute).to_s.downcase == input.to_s.downcase
    end
  end

  def find_by_id(input)
    find_by(:id, input)
  end

  def find_by_item_id(input)
    find_by(:item_id, input)
  end

  def find_by_invoice_id(input)
    find_by(:invoice_id, input)
  end

  def find_by_quantity(input)
    find_by(:quantity, input)
  end

  def find_by_unit_price(input)
    find_by(:unit_price, input)
  end

  def find_by_created_at(input)
    find_by(:created_at, input)
  end

  def find_by_updated_at(input)
    find_by(:updated_at, input)
  end

  def find_all_by(attribute, input)
    invoice_items_objects.select do |i|
      i.send(attribute).to_s.downcase == input.to_s.downcase
    end
  end

   def find_all_by_id(input)
    find_all_by(:id, input)
  end

  def find_all_by_item_id(input)
    find_all_by(:item_id, input)
  end

  def find_all_by_invoice_id(input)
    find_all_by(:invoice_id, input)
  end

  def find_all_by_quantity(input)
    find_all_by(:quantity, input)
  end

  def find_all_by_unit_price(input)
    find_all_by(:unit_price, input)
  end

  def find_all_by_created_at(input)
    find_all_by(:created_at, input)
  end

  def find_all_by_updated_at(input)
    find_all_by(:updated_at, input)
  end

end

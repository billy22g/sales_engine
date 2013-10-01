

class TransactionRepo

  attr_reader :engine 
  
  def initialize(filename = "./data/transactions.csv", engine = SalesEngine.new)
    @transaction_list = []
    @filename = filename
    @engine = engine
  end

  def read_file
    CSV.read "./data/transactions.csv", headers: true, header_converters: :symbol
  end

  def transaction_objects
    if @transaction_list.empty?
      read_file.each do |row|
        @transaction_list << Transaction.new(row, engine)
      end
    end
    return @transaction_list
  end

  def all
    @transaction_objects ||= transaction_objects
  end

  def filename
    @filename
  end

  def transaction_list
    @transaction_list
  end

  def random
    transaction_objects.sample
  end

  def find_by(attribute, input)
    transaction_objects.find do |m|
      m.send(attribute).to_s.downcase == input.to_s.downcase
    end
  end

  def find_by_id(input)
    find_by(:id, input)
  end

  def find_by_invoice_id(input)
    find_by(:invoice_id, input)
  end

  def find_by_credit_card_number(input)
    find_by(:credit_card_number, input)
  end

  def find_by_credit_card_expiration_date(input)
    find_by(:credit_card_expiration_date, input)
  end

  def find_by_result(input)
    find_by(:result, input)
  end

  def find_by_created_at(input)
    find_by(:created_at, input)
  end

  def find_by_updated_at(input)
    find_by(:updated_at, input)
  end

  def find_all_by(attribute, input)
    transaction_objects.select do |transaction|
      transaction.send(attribute).to_s.downcase == input.to_s.downcase
    end
  end

   def find_all_by_id(input)
    find_all_by(:id, input)
  end

  def find_all_by_invoice_id(input)
    find_all_by(:invoice_id, input)
  end

  def find_all_by_credit_card_number(input)
    find_all_by(:credit_card_number, input)
  end

  def find_all_by_credit_card_expiration_date(input)
    find_all_by(:credit_card_expiration_date, input)
  end

  def find_all_by_result(input)
    find_all_by(:result, input)
  end

  def find_all_by_created_at(input)
    find_all_by(:created_at, input)
  end

  def find_all_by_updated_at(input)
    find_all_by(:updated_at, input)
  end

end

require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/item"
require "csv"

class ItemsTest < MiniTest::Test
  def contents
    contents = CSV.read "./data/items.csv", headers: true, header_converters: :symbol
  end

  def item_attributes
    contents.each do |attribute|
      id          = attribute[:id],        
      name        = attribute[:name],       
      description = attribute[:description],
      unit_price  = attribute[:unit_price], 
      merchant_id = attribute[:merchant_id],
      created_at  = attribute[:created_at], 
      updated_at  = attribute[:updated_at] 
    end
  end

  def item
    #what does pipes mean??
    @item ||= Item.new(item_attributes)
  end

  def test_it_gets_item_id
    assert_equal item_attributes[:id], item.item_id
  end

  def test_it_gets_name
    assert_equal item_attributes[:name], item.item_name
  end

  def test_it_gets_description
    assert_equal item_attributes[:description], item.item_description
  end

  def test_it_gets_unit_price
    assert_equal item_attributes[:unit_price], item.item_unit_price
  end

  def test_it_gets_merchant_id
    assert_equal item_attributes[:merchant_id], item.item_merchant_id
  end

  def test_it_gets_created_at
    assert_equal item_attributes[:created_at], item.item_created_at
  end
  def test_it_gets_updated_at
    assert_equal item_attributes[:updated_at], item.item_updated_at
  end
end

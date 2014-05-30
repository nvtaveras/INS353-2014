require 'yaml'

class Order
  
  attr_accessor :products

  def initialize file_name
    @products = YAML.load_file(file_name)
  end

  def filter_by_category
  end

  def filter_by_price
  end

  def add_product
  end

  def get_product
  end

  def save
  end

end
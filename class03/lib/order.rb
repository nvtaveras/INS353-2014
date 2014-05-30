require 'yaml'

class Order
  
  attr_accessor :products

  def initialize file_name = ''
    if file_name.empty?
      @products = []
    else
      @products = YAML.load_file(file_name)
    end
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
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

  def filter_by_category category
    @products.select { |p| p.category == category }
  end

  def filter_by_price low, high
    @products.select { |p| p.price >= low && p.price <= high }
  end

  def add_product title, price, category
    @products.push(Product.new(title, price, category))
  end

  def get_product title
    @products.select { |p| p.title == title }.first
  end

  def save
  end

end
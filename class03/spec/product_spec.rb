require 'spec_helper.rb'

describe Product do
  
  before :each do
    @P = Product.new('Macbook Pro', 1599.99, :electronics)
  end

  describe "When creating a new product" do
    context "With valid parameters" do
      it "should take 3 parameters and return a Product object" do
        expect @P.class.should == Product
      end
    end
  end

  describe "#title" do
    it "should return the product title" do
      expect @P.title.should == 'Macbook Pro'
    end
    it "should be a string"
  end

  describe "#price" do
    it "should return the product price"

    it "should be a float"
  end

  describe "#category" do
    it "should return the product category"

    it "should be a symbol"
  end

end
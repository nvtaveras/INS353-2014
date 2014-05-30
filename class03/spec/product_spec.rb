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

    it "should be a string" do
      expect @P.title.class.should == String
    end
  end

  describe "#price" do
    it "should return the product price" do
      expect @P.price.should == 1599.99
    end

    it "should be a float" do
      expect @P.price.class.should == Float
    end
  end

  describe "#category" do
    it "should return the product category" do
      expect @P.category.should == :electronics
    end

    it "should be a symbol" do
      expect @P.category.class.should == Symbol
    end
  end

end
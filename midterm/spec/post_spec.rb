require 'spec_helper'

describe Post do

  before :each do
    @user = User.new('ntaveras')
    @post = Post.new('My Blog Title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae est eget ipsum tincidunt accumsan at eu mi tor.', Date.new(2014, 05, 06), @user)
  end

  describe "#initialize" do

    context "with a yaml file" do
      it "should properly load a post from a yaml file"
    end

    context "with proper attributes" do
      it "should properly initialize a post instance" do
        expect @post.title.should == 'My Blog Title'
        expect @post.text.should == 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae est eget ipsum tincidunt accumsan at eu mi tor.'
        expect @post.date.should == Date.new(2014, 05, 06)
        expect @post.user.username.should == 'ntaveras'
        expect @post.class.should == Post
      end
    end

  end
  describe "#summary" do
    it "should display the first 10 words of text" do
      expect @post.summary.should == 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae'
    end
  end

  describe "#tagme" do
    it "should be able to tag with 1 tag"
    it "should be able to tag with 4 tags"
  end

  describe "#same?" do
    it "should return true if Title, Date and Text are the same"
    it "should return false if Title, Date and Text are not the same"
  end

  describe "#display_entry" do
    it "should properly output a post entry"
  end

  describe "#save" do
    it "should save the post to a YAML file"
  end

end
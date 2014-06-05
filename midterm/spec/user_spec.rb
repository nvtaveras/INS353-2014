require 'spec_helper'

describe User do

  before :each do
    @user = User.new('ntaveras')
    @user.add_post('My Awesome Post', 'First Post!', Date.new(2014, 05, 06))
    @user.add_post('My Second Awesome Post', 'Second Post!', Date.new(2014, 05, 16))
    @user.add_post('My Third Awesome Post', 'Third Post!', Date.new(2014, 05, 03))
  end

  describe "#initialize" do
    it "should properly initialize with an username" do
      expect @user.username.should == 'ntaveras'
    end
  end

  describe "#add_post" do
    it "should add a post to the posts list" do
      expect @user.posts_list.length.should == 3
    end
  end

  describe "#posts" do
    it "should return the posts added in reverse chronological order" do
      post = @user.posts
      expect post[0].date.should == Date.new(2014, 05, 16)
      expect post[1].date.should == Date.new(2014, 05, 06)
      expect post[2].date.should == Date.new(2014, 05, 03)
    end
  end

  describe "#list" do
    it "should properly ouput all posts"
  end

  describe "#find_post_by_title" do
    it "should return a post by title" do
      expect @user.find_post_by_title('My Awesome Post').text.should == 'First Post!'
    end
    it "should return the first one if there are several with the same name" do
      @user.add_post('My Awesome Post', 'First Post Again!', Date.new(2014, 05, 02))
      expect @user.find_post_by_title('My Awesome Post').text.should == 'First Post!'
    end
  end

end
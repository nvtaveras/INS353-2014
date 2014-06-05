require 'spec_helper'

describe User do

  before :each do
    @user = User.new('ntaveras')
    @user.add_post('My Awesome Post', 'First Post!', Date.new(2014, 05, 06))
    @user.add_post('My Second Awesome Post', 'Second Post!', Date.new(2014, 05, 06))
  end

  describe "#initialize" do
    it "should properly initialize with an username" do
      expect @user.username.should == 'ntaveras'
    end
  end

  describe "#add_post" do
    it "should add a post to the posts list" do
      expect @user.posts_list.length.should == 2
    end
  end

  describe "#list" do
    it "should properly ouput all posts"
  end

  describe "#find_post_by_title" do
    it "should return a post by title"
    it "should return the first one if there are several with the same name"
  end

end
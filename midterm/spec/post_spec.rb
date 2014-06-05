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
    it "should be able to tag with 1 tag" do
      @post.tagme(:cool)
      expect @post.tags.length.should == 1
      expect @post.tags[0].should == :cool
    end
    it "should be able to tag with 4 tags" do
      @post.tagme(:midterm, :ruby, :rails, :fun)
      expect @post.tags.length.should == 4
      expect @post.tags[2].should == :rails
    end
  end

  describe "#same?" do
    it "should return true if Title, Date and Text are the same" do
      anotherpost = Post.new('My Blog Title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae est eget ipsum tincidunt accumsan at eu mi tor.', Date.new(2014, 05, 06), User.new('awesome_user'))
      expect @post.same?(anotherpost).should == true
    end
    it "should return false if Title, Date and Text are not the same" do
     anotherpost = Post.new('Another Blog Title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae est eget ipsum tincidunt accumsan at eu mi tor.', Date.new(2014, 05, 06), @user)
     expect @post.same?(anotherpost).should == false
   end
  end

  describe "#display_entry" do
    it "should properly output a post entry" do
      @test_blog = Post.new('My Blog Title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae est eget ipsum tincidunt accumsan at eu mi tor.', Date.new(2013, 06, 06), User.new('Gabriel'))
      @test_blog.tagme(:supercool, :awesome, :bonkers)

      user_value = 'Gabriel'
      date_value = '2013-06-06'
      title_value = 'My Blog Title'
      text_value = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae est eget ipsum tincidunt accumsan at eu mi tor.'
      tags_value = 'Tags: :supercool, :awesome, :bonkers'

      str_expected = "Gabriel, 2013-06-06"
      str_expected += "\n#{title_value}"
      str_expected += "\n#{text_value}"
      str_expected += "\n#{tags_value}"

      expect @test_blog.display_entry.should == str_expected
    end
  end

  describe "#save" do
    it "should save the post to a YAML file" do
      @post.tagme(:midterm, :ruby, :rails, :fun)
      @post.user.add_post('My Awesome Post', 'First Post!', Date.new(2014, 05, 06))
      @post.save
    end
  end

end
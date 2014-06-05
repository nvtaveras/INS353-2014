require_relative 'post'

class User

  attr_accessor :username, :posts_list

  def initialize username
    @username = username
    @posts_list = []
  end

  def add_post title, text, date
    @posts_list.push(Post.new(title, text, date, self))
  end

  def posts
    @posts_list.sort_by { |post| post.date }.reverse
  end

  def find_post_by_title title
    @posts_list.select { |post| post.title == title }.first
  end

  def list
    str = ""
    for p in @posts_list
      str += @posts_list.display_entry
    end
    str
  end

  def tag_cloud
    frequency = Hash.new
    for post in @posts_list
      tags_list = post.tags
      for tag in tags_list
        frequency[tag] += 1
      end
    end
    frequency.sort_by { |_key, value| value }
  end

end
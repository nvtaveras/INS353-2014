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

end
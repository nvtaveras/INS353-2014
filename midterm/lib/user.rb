class User

  attr_accessor :username, :posts

  def initialize username
    @username = username
    posts = []
  end

end
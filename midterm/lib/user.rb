class User

  attr_accessor :username, :posts_list

  def initialize username
    @username = username
    posts_list = []
  end

end
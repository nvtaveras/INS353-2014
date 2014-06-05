class Post

  attr_accessor :title, :text, :date, :user

  def initialize *args
    if args.length == 1
      # load from YAML file
    else
      @title = args[0]
      @text = args[1]
      @date = args[2]
      @user = args[3]
  end

end
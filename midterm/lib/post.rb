class Post

  attr_accessor :title, :text, :date, :user, :tags

  def initialize *args
    if args.length == 1
      # load from YAML file
    else
      @title = args[0]
      @text = args[1]
      @date = args[2]
      @user = args[3]
      @tags = []
    end
  end

  def summary
    str = ""
    words = @text.split
    limit = words.length >= 10 ? 10 : words
    for i in 0..limit - 1
      str += "#{words[i]} "
    end
    str.chop
  end

  def tagme *args
    for tag in args
      tags.push(tag)
    end
  end

end
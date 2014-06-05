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

  def same? post
    (@title == post.title) && (@text == post.text) && (@date == post.date)
  end

  def display_entry
    str = "Tags: "
    limit = @tags.length - 1
    for i in 0.. limit
      str += ", " if i > 0
      str += ":#{@tags[i]}"
    end
    "#{@user.username}, #{@date}\n#{@title}\n#{@text}\n" + str
  end

  def save
    title_words = @title.split
    title_parameterized = ""

    for w in title_words
      w = w.downcase
      title_parameterized += "#{w}-"
    end

    File.open title_parameterized + 'yml', 'w' do |f|
      f.write YAML::dump self
    end
  end

end
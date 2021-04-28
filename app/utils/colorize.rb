class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def black
    colorize(30)
  end

  def pink
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def red
    colorize(35)
  end

  def cyan
    colorize(36)
  end

  def white
    colorize(37)
  end

  def grey
    colorize(38)
  end

  def bg_black_color_white
    colorize(40)
  end

  def bg_red_color_white
    colorize(41)
  end

  def bg_green_color_white
    colorize(42)
  end

  def bg_yellow_color_white
    colorize(43)
  end

  def bg_blue_color_white
    colorize(44)
  end

  def bg_pink_color_white
    colorize(45)
  end

  def bg_cyan_color_white
    colorize(46)
  end

  def bg_white_color_white
    colorize(47)
  end

  def bordered
    colorize(51)
  end
end

class BaseView
  def ask_user_for(stuff)
    puts stuff.to_s.capitalize
    print '> '
    gets.chomp
  end

  def display(stuffs); end
end

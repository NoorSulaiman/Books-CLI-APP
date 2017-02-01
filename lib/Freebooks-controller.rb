class FreeBooksController

  def call
    puts "                         *********************** "
    puts "                         Welcome To FreeBooks!!! "
    puts "                         *********************** "
    category_list
    menu
    goodbye
  end

  def category_list
    x = Scraper.new
    x.scrape_category
    x.category.each_with_index do |category,index|
    puts "#{index + 1}.#{category}"
    puts "             "
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Please type category number or list for category list or type exit !"
    puts "***********************************************"
    input = gets.strip.downcase
    if (input.to_i > 0) && (input.to_i < 40)
      Book.clear
      Scraper.clear
      x = Scraper.new
      x.scrape_category
      x.scrape_book(x.category[input.to_i-1])
      Book.print_books
    elsif input == "list"
      Scraper.clear
      category_list
    else
      
      end
    end
  end

  def goodbye
    puts "   **************** "
    puts "   *   Good Bye!  * "
    puts "   **************** "
  end

end

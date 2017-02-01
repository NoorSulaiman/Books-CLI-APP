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
    if (input.to_i > 0) && (input.to_i < 83)
      Books.clear
      Scraper.clear
      x = Scraper.new
      x.scrape_category
      x.scrape_book(x.category[input.to_i-1])
      x.print_books
      choose_book
    elsif input == "list"
      Scraper.clear
      category_list
    else
      puts "Invalid input, please select within category list!"
      end
    end
  end
  def choose_book
    input = nil
    while input != "exit"
    puts "Select a book number to go to the web page or list to get categories or exit !"
    input = gets.strip
    if (input.to_i > 0) && (input.to_i < 10)
      system("open /http://www.free-ebooks.net#{Books.all[input.to_i-1].url}")
      elsif
        input == "list"
          Scraper.clear
          category_list
        else
          puts "Invalid input, please select within category list!"
      end
    end
  end
  def goodbye
    puts "   **************** "
    puts "   *   Good Bye!  * "
    puts "   **************** "
  end
end

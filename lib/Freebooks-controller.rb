class FreeBooksController

  def call
    puts "                         *********************** "
    puts "                         Welcome To FreeBooks!!! "
    puts "                         *********************** "
    menu
    goodbye
  end

  def category_list
    x = CategoryScraper.new
    x.scrape_category
    x.category.each_with_index do |category,index|
    puts "#{index + 1}.#{category}"
    puts "             "
    end
  end

  def menu
    category_list
    input = nil
    while input != "exit"
    puts "Please type list for category list or type exit !"
    puts "***********************************************"
    input = gets.strip.downcase
    if input.to_i > 0
      x = CategoryScraper.new
      x.scrape_category
      x.scrape_book(x.category[input.to_i-1])
      x.print_books
    elsif input == "list"
      category_list
    else
      "Invalid input, please enter list or exit !"
      end
    end
  end
  def goodbye
    puts "   **************** "
    puts "   *   Good Bye!  * "
    puts "   **************** "
  end
end

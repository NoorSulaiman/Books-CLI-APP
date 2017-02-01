class Scraper
  @@all = []
  def category
    @@all.delete_if {|cat| (cat.include? " ") || (cat.include? "/") || (cat.include? "Postmodernism") || (cat.include? "Religion") || (cat.include? "Technology") || (cat.include? "Environment") || (cat.include? "Communications")}

  end

  def scrape_category
    doc = Nokogiri::HTML(open("http://www.free-ebooks.net/category/"))
    category = doc.css(".span8")
    category.each do |name|
      @@all << name.css("h3").text
    end
    @@all.shift

  end

    def scrape_book(input)
        doc = Nokogiri::HTML(open("http://www.free-ebooks.net/category/#{input}"))
        book = doc.css(".span20.mt10")
        book.each do |data|
          obj = Books.new
          obj.title = data.css("h3 a").text.strip
          obj.author = data.css(".span10 a:first-child").text.strip
          obj.url = data.css(".span10 a:first-child").attr("href").value
        end
      end

  def print_books
    puts "Books in this category :"
    puts ""
      Books.all.each_with_index do |book,index|
        if book.title

          puts "#{index + 1}- Title: #{book.title}"

          puts "    Author: #{book.author}"

          puts "     URL : #{book.url}"
          puts "------------------------"
        end
      end
    end
    def self.clear
      @@all = []
    end
end

class Book
  attr_accessor :title, :author, :url
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
  def self.clear
    @@all =[]
  end
  def self.print_books
    puts "Books in this category :"
    puts ""
    Book.all.each_with_index do |book,index|
      if book.title

        puts "#{index + 1}- Title: #{book.title}"

        puts "    Author: #{book.author}"

        puts "     URL : #{book.url}"
        puts "------------------------"
      end
    end
  end


end

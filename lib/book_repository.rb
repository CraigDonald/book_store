require_relative './book'

# Model class
# lib/book.rb

# Repo class
# lib/book_repository.rb

class BookRepository

    def initialize
        @books = []
    end

    def all
        sql = 'SELECT id, title, author_name FROM books;'
        # returns array of books from table
        # prints list to console
        results = DatabaseConnection.exec_params(sql, [])

        results.each do |chosen_book|
            book = Book.new
            book.id = chosen_book['id']
            book.title = chosen_book['title']
            book.author_name = chosen_book['author_name']
            @books << book
        end
        return @books
    end
end
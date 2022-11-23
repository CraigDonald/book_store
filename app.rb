# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/book'
require_relative 'lib/book_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, title, author_name FROM books;'
result = DatabaseConnection.exec_params(sql, [])



#Write a small program in app.rb using the class BookRepository to print out the list of books to the terminal.

# Print out each record from the result set .
result.each do |record|
  p record
end


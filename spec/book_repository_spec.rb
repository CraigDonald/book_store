# EXAMPLE

# file: spec/book_repository_spec.rb

require 'book_repository'


RSpec.describe BookRepository do
    
    def reset_books_table
        seed_sql = File.read('spec/seeds_books.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
        connection.exec(seed_sql)
    end
  
  
    before(:each) do 
      reset_books_table
    end
    
    it 'Retrieve list of books' do
            repo = BookRepository.new
            all_books = repo.all

            expect(all_books.length).to eq(5) # => 5
            expect(all_books.first.id).to eq('1') # => '1'
            expect(all_books.first.title).to eq('Nineteen Eighty-Four') # => 'Nineteen Eighty-Four'
            expect(all_books.first.author_name).to eq('George Orwell') # => 'George Orwell'
        end
end
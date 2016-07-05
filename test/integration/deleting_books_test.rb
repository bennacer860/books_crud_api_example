require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create!(title: "title", rating: 4)
  end
  
  test 'delete a book' do
    delete "/api/v1/books/#{@book.id}"
    assert_equal 204,response.status
  end
  
end

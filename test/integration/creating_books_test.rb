require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest

  test 'create a new book' do
    post '/books', {} , {}
    assert_equal 201,reponse.status
    book = json(response.body)
    assert_equal book_url(book[:id]), response.location
    assert_equal Mime::JSON, response.content_type
  end
end

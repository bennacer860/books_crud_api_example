require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest

  test 'create a new book with valid data' do
    post '/books', { book: {title: "title",rating: 5} }.to_json , { "Accept" => "application/json", "Content-Type" => "application/json" }
    assert_equal 201,response.status
    book = json(response.body)
    assert_equal book_url(book[:id]), response.location
    assert_equal Mime::JSON, response.content_type
    assert_equal "title",book[:title]
    assert_equal 5,book[:rating]
  end

  test 'not create book with invalid data ' do
    post '/books', { book: {title: nil,rating: 5} }.to_json , { "Accept" => "application/json", "Content-Type" => "application/json" }
    assert_equal 422,response.status
  end

end

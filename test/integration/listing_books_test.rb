require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create(title: "Game of Thrones", rating: 5)
    Book.create(title: "Game of Thrones : Ice and Fire", rating: 4)
  end
  
  test 'listing books' do
    get '/books'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal Book.count, JSON.parse(response.body).size
  end

  test 'list top rated books ' do
    get '/books?rating=5'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1, JSON.parse(response.body).size
  end

end

require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  test 'listing books' do
    get '/books'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

end

require 'test_helper'

class ListingFinishedBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create(title: "Game of Thrones", rating: 5, finished_at: nil)
    Book.create(title: "Game of Thrones : Ice and Fire", rating: 4, finished_at: 1.day.ago)
  end

  test 'list finished books in json' do
    get '/finished_books' ,{},{'Accept' => 'application/json'}
    assert_equal 200,response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1, json(response.body).size 
  end

  test 'list finished books in xml' do
    get '/finished_books' ,{},{'Accept' => 'application/xml'}
    assert_equal 200,response.status
    assert_equal Mime::XML, response.content_type
    assert_equal 1, Hash.from_xml(response.body)['books'].size 
  end

end

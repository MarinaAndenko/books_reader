require 'test_helper'

class BookFlowTest < ActionDispatch::IntegrationTest
	test "can create a book" do
	  get "/books/new"
	  assert_response :success
	  post "/books",
	    params: { book: { name: "book", author: "author", description: "description", draft: false } }
	  assert_response :redirect
	  follow_redirect!
	  assert_response :success
	end
end
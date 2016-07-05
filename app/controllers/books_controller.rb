class Api::V1::BooksController < ApplicationController
  # skip_before_action :verify_authenticity_token, if: :json_request?
  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }


  def json_request?
    request.format.json?
  end

  def index
    books = []
    if rating = params[:rating]
      books = Book.where(rating: rating)
    else
      books = Book.all
    end
    render json: books, status: 200
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: 201, location: book
    else
      render json: book.errors, status: 422
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
    render nothing: true, status: 204
  end

  def book_params
    params.require(:book).permit(:title,:rating)
  end
end

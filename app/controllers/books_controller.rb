class BooksController < ApplicationController
  # skip_before_action :verify_authenticity_token, if: :json_request?
  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }


  def json_request?
    request.format.json?
  end

  def index
    render json: Book.all, status: 200
  end
end

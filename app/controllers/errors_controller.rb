class ErrorsController < ApplicationController
  def not_found_page
    render status: 404
  end

  def internal_server_error
    render status: 500
  end
end

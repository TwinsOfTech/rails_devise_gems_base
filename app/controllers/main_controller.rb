class MainController < ApplicationController
  respond_to :html

  def index
    if user_signed_in?
      #redirect_to trips_path
      render
    else
      render
    end
  end

private

end

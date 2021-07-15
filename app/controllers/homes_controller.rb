class HomesController < ApplicationController
  def index
    redirect_to user_management_path if user_signed_in?
  end
end
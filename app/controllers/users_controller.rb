class UsersController < ApplicationController
  def initialize()

  end

  def management
    if user_signed_in? then
      @user = User.find(current_user.id)
      if Token.exists?(user_id: current_user.id) then
        @exists_check=true;
      else
        @exists_check=false;
      end
    else
      redirect_to '/users/sign_in'
    end
  end


  private
  def getUserName
    @userName
  end

  private
  def setUserName(userName)
    @userName = userName
  end
end

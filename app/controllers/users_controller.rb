class UsersController < ApplicationController
  before_action :authenticate_user!

  def management
    @user = User.find(current_user.id)
    if Token.exists?(user_id: current_user.id)
      @exists_check=true;
    else
      @exists_check=false;
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

class LinksController < ApplicationController
  def index

  end

  def create
    require 'net/http'
    require 'uri'
    require 'json' 

    # ログインしていない場合の処理
    if !is_login() then
      redirect_method()
      return
    end

    # ユーザー情報をセット
    setUser(current_user.id)

    @Token = Token.find_by(user_id: getUser.id)

    token = @Token.messaging_token

    # post先のurl
    uri = URI.parse('https://api.line.me/v2/bot/message/broadcast')
    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = true

    # Header
    headers = {
        'Authorization'=>"Bearer #{token}",
        'Content-Type' =>'application/json',
        'Accept'=>'application/json'
    }
    send_message = params[:title]
    send_message = send_message + "\n" + params[:body]
    # Body
    params = {"messages" => [{"type" => "text", "text" => send_message}]}

    response = http.post(uri.path, params.to_json, headers)
  end

  private

  # リダイレクト処理
  private
  def is_login()
    if user_signed_in? then
      return true
    else
      return false
    end
  end

  private
  def redirect_method()
    redirect_to '/users/sign_in'
  end

  private
  def getUser
    @user
  end

  # ユーザーセット
  private
  def setUser(id)
    @user = User.find(id)
  end
  
end

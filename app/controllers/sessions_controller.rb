class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      flash[:error_message]='ログイン情報が正しくありません。'
      redirect_to home_new_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to home_new_path
  end
end

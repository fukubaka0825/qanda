class UsersController < ApplicationController
  before_action :set_user,only: [:edit,:update,:destroy]
  
  def index
    @users = User.page(params[:page]).per(20).order('updated_at DESC')
  end
  
  def new
    # バリデーションエラーで戻されても入力復帰
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_to new_user_path ,flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end
  
  def edit
  end
  
  def update
   if @user.update(user_params)
      redirect_to mypage_path, notice: 'ユーザーを修正しました'
    else
      flash[:alert] = 'ユーザー修正失敗しました'
      render :new
   end
  end
  
  def destroy
     if @user.destroy
      redirect_to users_path, notice: 'ユーザーを削除しました'
     end
  end

  def me
  end
  
  private
  
  def set_user
     @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end

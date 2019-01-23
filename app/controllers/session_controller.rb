class SessionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user = User.where(user_name: params[:user_name], password: params[:password])
    if user.empty?
      redirect_to login_path()
      flash[:no_acc] = "user or password is incorrect"
    else
      session[:user_id] = user.ids[0]
      redirect_to new_search_path()
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path()
  end
end

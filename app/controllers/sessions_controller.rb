class SessionsController < ApplicationController

  def new
    redirect_to game_path if current_user
  end

  def create
    @user = User.find_or_create_from_auth(auth_hash)
    if @user
      session[:user_id] = @user.id
      redirect_to game_path
    else
      flash.now[:notice] = "Something went wrong. Please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

    def auth_hash
      request.env['omniauth.auth']
    end

end

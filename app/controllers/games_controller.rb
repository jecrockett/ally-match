class GamesController < ApplicationController
  before_action :authorize!

  def show
    @user = current_user
  end

end

class HighScoresController < ApplicationController

  def index
    @users = User.limit(10)
  end

end

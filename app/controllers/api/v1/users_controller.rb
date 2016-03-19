class Api::V1::UsersController < Api::ApiController
  respond_to :json

  def update
    user = current_user
    if user.high_score.nil? || user.high_score > params[:score].to_i
      user.high_score = params[:score]
      user.save
    end
    respond_with user
  end

end

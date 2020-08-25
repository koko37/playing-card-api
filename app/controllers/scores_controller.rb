class ScoresController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    render json: {
      scores: high_scores
    }, status: :ok
  end

  def create
    @score = current_user.scores.new score_params

    if @score.save
      render json: {
        message: "success",
        scores: high_scores
      }, status: :ok
    else
      render json: {
        message: "Incorrect point!"
      }, status: :unprocessable_entity
    end
  end

  private

  def high_scores
    Score.order(point: :desc).limit(ENV['HISTORY_LIMITS'].to_i).map do |s|
      {id: s.id, username: s.user.username, point: s.point, at: s.created_at}
    end
  end

  def score_params
    params.permit(:point)
  end
end

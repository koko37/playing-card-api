class ScoresController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    render json: {
      scores: Score.order(point: :desc)
    }, status: :ok
  end

  def create
    @score = current_user.scores.new score_params

    if @score.save
      render json: {
        message: "success",
        scores: Score.order(point: :desc).limit(ENV['HISTORY_LIMITS'].to_i)
      }, status: :ok
    else
      render json: {
        message: "Incorrect point!"
      }, status: :unprocessable_entity
    end
  end

  private

  def score_params
    params.permit(:point)
  end
end

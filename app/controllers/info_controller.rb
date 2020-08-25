class InfoController < ApplicationController
  def hello
    render json: {
      message: 'pong'
    }, status: :ok
  end
end

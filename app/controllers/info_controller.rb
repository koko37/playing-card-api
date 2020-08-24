class InfoController < ApplicationController
  def hello
    render json: {
      message: 'v1.0'
    }, status: :ok
  end
end

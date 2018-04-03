class Api::V1::AthletesController < ApplicationController
  def index
    athletes = Athlete.all
    render json: athletes, status: :ok
  end
end

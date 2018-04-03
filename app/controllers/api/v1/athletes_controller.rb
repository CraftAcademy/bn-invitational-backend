class Api::V1::AthletesController < ApplicationController
  def index
    athletes = Athlete.all
    render json: athletes, status: :ok
  end

  def show
    athlete = Athlete.find_by(id: params[:id])
    render json: athlete, serializer: Athlete::ShowSerializer, status: :ok 
  end
end

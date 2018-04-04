class Api::V1::AthletesController < ApplicationController
  before_action :find_athlete_and_result
  def index
    render json: @athletes, status: :ok
  end

  def show
    render json: @athlete, serializer: Athlete::ShowSerializer, status: :ok
  end

  def update
    render json: {status: 'Thank you for your vote.'} if @result.updated_votes(params)
  end

  private

  def find_athlete_and_result
    @athletes = Athlete.all
    @athlete = Athlete.find_by(id: params[:id])
    @result = Result.find_by(athlete: params[:id])
  end
end

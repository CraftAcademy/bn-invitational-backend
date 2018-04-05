class Api::V1::AthletesController < ApplicationController
  before_action :find_athlete_and_result
  def index
    render json: @athletes, status: :ok
  end

  def show
    render json: @athlete, serializer: Athlete::ShowSerializer, status: :ok
  end

  def update
    render json: { status: 'Thank you for casting your vote!' } if @result.updated_votes(params)
  end

  def create
    athlete = Athlete.new(athlete_params)
    if athlete.save
      Result.create(athlete: athlete)
      render_message('Athlete successfully created!')
    else
      render_message('Please fill in all fields.')
    end
  end

  private

  def athlete_params
    params.permit(:name, :age, :home)
  end

  def find_athlete_and_result
    @athletes = Athlete.all
    @athlete = Athlete.find_by(id: params[:id])
    @result = Result.find_by(athlete: params[:id])
  end

  def render_message(message)
    render json: { status: message }
  end
end

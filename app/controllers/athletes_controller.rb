class AthletesController < ApplicationController
  #Array.include Results

  def index
    sorted_results
    sorted_athletes
  end

  def create
    athlete = Athlete.new(athlete_params)
    if athlete.save
      Result.create(athlete: athlete)
      flash[:success] = 'Athlete successfully created'
       redirect_to root_path
    else
      flash[:error] = athlete.errors.full_messages.first
      redirect_back(fallback_location: root_path)
    end
  end


def toggle
  athlete = Athlete.find(params[:id])
  athlete.open_or_close_voting
  redirect_to root_path
end

def publish
  if Result.publish_results
    flash[:success] = 'Result successfully published'
    redirect_to root_path
  else
    flash[:error] = 'You have no results to publish'
    redirect_to root_path
  end
end
  private

  def sorted_results
    results = Result.all
    @sorted_results = results.sort_by { |result| result[:score] }.reverse
    @sorted_results.each { |result| result.valid_score = true if result.number_of_votes > 4 }
    @sorted_results
  end

  def sorted_athletes
    athletes = Athlete.all
    @sorted_athletes = athletes.sort_by { |athlete| athlete[:starttime] }
    @sorted_athletes
  end

  def athlete_params
    params.require(:athlete).permit(:name, :age, :home, :image, :starttime)
  end
end

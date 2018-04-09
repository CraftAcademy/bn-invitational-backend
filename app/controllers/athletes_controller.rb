class AthletesController < ActionController::Base

  def index
    sorted_results
  end

  def create
    athlete = Athlete.new(athlete_params)
    if athlete.save
      Result.create(athlete: athlete)
      flash.now[:success] = 'Athlete successfully created'
      render action: "index"
    else
      flash[:error] = athlete.errors.full_messages.first
      render action: "new"
    end
  end

  private

  def sorted_results
    results = Result.all
    @sorted_results = results.sort_by { |result| result[:score] }.reverse
    @sorted_results.each { |result| result.validscore = true if result.numberofvotes > 4 }
    @sorted_results
  end

  def athlete_params
    params.require(:athlete).permit(:name, :age, :home, :image, :starttime)
  end
end

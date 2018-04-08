class AthletesController < ActionController::Base
  
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

  def athlete_params
    params.require(:athlete).permit(:name, :age, :home, :image, :starttime)
  end
end

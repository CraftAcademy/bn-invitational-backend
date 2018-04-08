class AthletesController < ActionController::Base

  def create
    athlete = Athlete.new(athlete_params)
    if athlete.save
      Result.create(athlete: athlete)
      # flash.now[:success] = 'Athlete successfully created'
      render action: "index", notice: 'Athlete successfully created'
    else
      flash[:error] = athlete.errors.full_messages.first
      render action: "new"
    end
  end

  def show
    @athlete = Athlete.find_by(id: params[:id])
  end

  def edit
    @athlete = Athlete.find_by(id: params[:id])
  end

  def destroy
    @athlete = Athlete.find_by(id: params[:id])
    @athlete.destroy
    redirect_to root_path
  end

  def update
    @athlete = Athlete.find_by(id: params[:id])
    if @athlete.update(athlete_params)
     flash.now[:success] = 'Athlete successfully edited'
     redirect_to athlete_path(@athlete)
    else
     flash[:error] = error_message(@athlete)
     render 'edit'
    end
  end

  private

  def athlete_params
    params.require(:athlete).permit(:name, :age, :home, :image, :starttime)
  end
end

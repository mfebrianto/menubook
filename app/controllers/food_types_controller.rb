class FoodTypesController < ActionController::Base

  def index
    respond_to do |format|
      format.json { render :json => FoodType.all}
    end
  end

end
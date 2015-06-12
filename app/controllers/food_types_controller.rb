class FoodTypesController < ActionController::Base

  def index
    respond_to do |format|
      format.json { render json: FoodType.all}
    end
  end

  def create
    food_type = FoodType.new(food_type_attributes)
    food_type.save
    respond_to do |format|
      format.json { render json: food_type}
    end
  end

  def destroy
    food_type = FoodType.find(params[:id])
    if food_type.destroy
      respond_to do |format|
        format.json { head :ok}
      end
    end
  end

  private

  def food_type_attributes
    params.require(:food_type).permit(:name, :description)
  end
end
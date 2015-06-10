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

  private

  def food_type_attributes
    params.require(:food_type).permit(:name, :description)
  end
end
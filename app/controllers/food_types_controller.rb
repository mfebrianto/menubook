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

  def delete
    food_type = FoodType.find(food_type_id[:id])
    if food_type.destroy
      respond_to do |format|
        format.json { render json: food_type}
      end
    end
  end

  private

  def food_type_id
    params.require(:food_type).permit(:id)
  end

  def food_type_attributes
    params.require(:food_type).permit(:name, :description)
  end
end
class FoodsController < ActionController::Base

  def create
    food = Food.new(food_attributes)
    if food.save
      respond_to do |format|
        format.json { render json: food}
      end
    end
  end

  private

  def food_attributes
    params.require(:food).permit(:name, :description)
  end

end
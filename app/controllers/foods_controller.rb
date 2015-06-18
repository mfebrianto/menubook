class FoodsController < ActionController::Base

  def index
    respond_to do |format|
      format.json { render json: Food.all}
    end
  end

  def upload_image
    food = Food.find(params[:food_id])
    food.food_image = params[:food_image]
    if food.save
      respond_to do |format|
        format.json { render json: food}
      end
    end
  end

  def create
    food = Food.new(food_attributes)
    if food.save
      respond_to do |format|
        format.json { render json: food}
      end
    end
  end

  def delete
    food = Food.find(food_id[:id])
    if food.destroy
      respond_to do |format|
        format.json { render json: food}
      end
    end
  end

  private

  def food_image
    params.permit(:food_image, :id)
  end

  def food_id
    params.require(:food).permit(:id)
  end

  def food_attributes
    params.require(:food).permit(:name, :description)
  end

end
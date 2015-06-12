class FoodsController < ActionController::Base

  def upload_image
    p ">>>>>>>>#{params.inspect}"
    food_image = Food.new(ActiveSupport::JSON.decode(params["food_image"]))
    # food_image.save
    p ">>>>>>>>#{food_image.inspect}"
  end


  def create
    food = Food.new(food_attributes)
    if food.save
      respond_to do |format|
        format.json { render json: food}
      end
    end
  end

  private

  def food_image
    params.permit(:food_image)
  end

  def food_attributes
    params.require(:food).permit(:name, :description)
  end

end
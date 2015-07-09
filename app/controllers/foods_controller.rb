class FoodsController < ActionController::Base

  def index
    respond_to do |format|
      format.json { render json: Food.all_with_images}
    end
  end

  def update
    food = Food.find(params[:id])
    if food.update_attributes(name: params[:name],
                              description: params[:description],
                              food_image: params[:food_image],
                              price: params[:price])
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

  def show
    food = Food.find_with_images(find_food_id_param)
    if food.present?
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

  def find_food_id_param
    params.require(:id)
  end

  def food_id
    params.require(:food).permit(:id)
  end

  def food_attributes
    params.require(:food).permit(:name, :description, :price)
  end

end
class Food < ActiveRecord::Base

  belongs_to :food_type

  has_attached_file :food_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :food_image, :content_type => /\Aimage\/.*\Z/

  def self.all_with_images
    all_foods_with_image_url = []
    foods = self.all
    foods.each do |food|
      all_foods_with_image_url << {id: food.id, name: food.name,
                                   description: food.description,
                                   price: food.price,
                                   image: food.food_image.url}
    end
    all_foods_with_image_url
  end
end
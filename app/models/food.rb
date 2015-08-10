class Food < ActiveRecord::Base

  belongs_to :food_type

  has_attached_file :food_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png" ,
                    :path => ":rails_root/public/menubook/system/:attachment/:id_partition/:style_:basename.:extension",
                    :url  => "menubook/system/:attachment/:id_partition/:style_:basename.:extension"
  validates_attachment_content_type :food_image, :content_type => /\Aimage\/.*\Z/

  def self.all_with_images
    all_foods_with_image_url = []
    foods = self.all
    foods.each do |food|
      all_foods_with_image_url << {id: food.id, name: food.name,
                                   description: food.description,
                                   price: food.price.to_i,
                                   image: food.food_image.url}
    end
    all_foods_with_image_url
  end

  def self.find_with_images(id)
    food = self.find(id)
    {id: food.id, name: food.name,
     description: food.description,
     price: food.price.to_i,
     image: food.food_image.url}
  end
end
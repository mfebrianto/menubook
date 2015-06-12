class Food < ActiveRecord::Base

  belongs_to :food_type

  has_attached_file :food_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :food_image, :content_type => /\Aimage\/.*\Z/

end
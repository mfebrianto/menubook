class CreateFoodType < ActiveRecord::Migration
  def change
    create_table :food_types do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end

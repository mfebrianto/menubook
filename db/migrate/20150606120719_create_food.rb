class CreateFood < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :description
      t.string :food_type_id
      t.timestamps
    end
  end
end

class ChangeDescriptionInFoods < ActiveRecord::Migration
  def change
    change_column :foods, :description, :text
  end
end

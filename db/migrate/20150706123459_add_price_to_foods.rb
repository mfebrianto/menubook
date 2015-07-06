class AddPriceToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :price, :decimal, :precision => 8, :scale => 2
  end
end

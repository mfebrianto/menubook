require 'rails_helper'

describe FoodTypesController do

  describe 'index' do
    it 'should return the list of food types in json' do
      FoodType.create(name: 'brownie')
      FoodType.create(name: 'pie')
      get :index, format: :json
      expect(response.body).to eq ActiveSupport::JSON.encode(FoodType.all)
    end
  end

  describe 'create' do
    it 'should return the created food type in json' do
      post :create, {format: :json, food_type: {name: 'brownie', description: 'this is brownie'}}
      food_type = FoodType.find_by_description('this is brownie')
      expect(ActiveSupport::JSON.decode(response.body)['name']).to eq food_type.name
    end
  end
end
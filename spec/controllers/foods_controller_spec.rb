require 'rails_helper'

describe FoodsController do

  describe 'index' do
    it 'should return the list of food types in json' do
      Food.create(name: 'chocolate brownie')
      Food.create(name: 'apple pie')
      get :index, format: :json
      expect(response.body).to eq ActiveSupport::JSON.encode(Food.all)
    end
  end

  describe 'create' do
    it 'should return the created food type in json' do
      post :create, {format: :json, food: {name: 'green tea brownie', description: 'this is a green tea brownie'}}
      food = Food.find_by_description('this is a green tea brownie')
      expect(ActiveSupport::JSON.decode(response.body)['name']).to eq food.name
    end
  end

end
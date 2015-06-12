require 'rails_helper'

describe FoodsController do

  describe 'create' do
    it 'should return the created food type in json' do
      post :create, {format: :json, food: {name: 'green tea brownie', description: 'this is a green tea brownie'}}
      food = Food.find_by_description('this is a green tea brownie')
      expect(ActiveSupport::JSON.decode(response.body)['name']).to eq food.name
    end
  end

end
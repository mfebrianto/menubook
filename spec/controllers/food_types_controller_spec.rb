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
end
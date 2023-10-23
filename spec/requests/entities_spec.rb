require 'rails_helper'
require 'devise'

RSpec.describe 'GroupsController', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'dieum', email: 'test@gmail.com', password: '123456')
    sign_in @user
  end

  describe 'GET /create' do
    before do
      Entity.create(name: 'food', amount: 5)
      get '/entities/new/'
    end

    it 'Returns a success link' do
      expect(response).to have_http_status(:success)
    end

    it 'Displays the new' do
      expect(response).to render_template(:new)
    end

    it 'Returns the body holder' do
      expect(response.body).to include('Create a new transaction')
    end
  end
end

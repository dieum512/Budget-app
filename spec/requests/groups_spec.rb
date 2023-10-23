require 'rails_helper'
require 'devise'

RSpec.describe 'GroupsController', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'dieum', email: 'test@gmail.com', password: '123456')
    sign_in @user
  end

  describe 'GET /index' do
    before do
      get '/groups/'
    end

    it 'Returns a success link' do
      expect(response).to have_http_status(:success)
    end

    it 'Displays the index' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /create' do
    before do
      Group.create(name: 'group 1', icon: 'www.myicon/path/icon.png')
      get '/groups/new/'
    end

    it 'Returns a success link' do
      expect(response).to have_http_status(:success)
    end

    it 'Displays the new' do
      expect(response).to render_template(:new)
    end

    it 'Returns the body holder' do
      expect(response.body).to include('Create a new group')
    end
  end

  describe 'GET /groups/:id' do
    it 'Displays a success' do
      group = Group.create(name: 'group 1', icon: 'www.myicon/path/icon.png')
      get "/groups/#{group.id}/"
      expect(response).to have_http_status(:success)
    end
  end
end

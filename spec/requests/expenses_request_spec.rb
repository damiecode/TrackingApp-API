require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  before(:each) do
    @user = create(:user)

    post '/sessions', params: { user: { username: @user.username, password: @user.password } }

    expense = attributes_for(:expense)
    expense2 = attributes_for(:expense2)

    post '/expenses', params: { expense: expense }
    @expense = JSON(response.body)

    post '/expenses', params: { expense: expense2 }
    @expense2 = JSON(response.body)
  end

  describe 'POST /create' do
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /index' do
    it 'returns list of expense related to Logged in User' do
      get '/expenses'
      expect(JSON(response.body).length).to eq(2)
    end
  end

  describe 'PATCH /update' do
    it 'returns updated expense item' do
      patch "/expenses/#{@expense2.fetch('id')}", params: { expense: { name: 'Noodle' } }

      expect(JSON(response.body).fetch('name')).to eq('Noodle')
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys selected expense and returns updated expense list' do
      delete "/expenses/#{@expense.fetch('id')}"

      expect(response).to have_http_status(:ok)
      expect(JSON(response.body)['expense'].length).to eq(1)
    end
  end
end

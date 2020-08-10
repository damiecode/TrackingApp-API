require 'rails_helper'

RSpec.describe 'Savings', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/savings/index'
      expect(response).to have_http_status(:success)
    end
  end
end

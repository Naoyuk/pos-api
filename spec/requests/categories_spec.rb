require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /api/v1/categories" do
    FactoryBot.create_list(:category, 20)

    it "returns http success" do
      get '/api/v1/categories'
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json['data'].length).to eq(18)
    end
  end

  describe "GET /api/v1/categories/:id" do
    category = FactoryBot.create(:category)
    it "returns http success" do
      get "/api/v1/categories/#{category.id}"
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json['data']['name']).to eq(category.name)
    end
  end

  describe "POST /api/v1/categories" do
    it 'creates a new category and returns http success' do
      valid_params = { name: "test" }

      expect { post '/api/v1/categories', params: { category: valid_params } }.to change(Category, :count).by(+1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /api/v1/categories/:id" do
    it 'updates a category and returns http success' do
      category = FactoryBot.create(:category)

      put "/api/v1/categories/#{category.id}", params: { category: { name: "updated!" } }
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json['data']['name']).to eq('updated!')
    end
  end

  describe "DELETE /api/v1/categories/:id" do
    it 'deletes a category and return https success' do
      category = FactoryBot.create(:category)

      expect { delete "/api/v1/categories/#{category.id}" }.to change(Category, :count).by(-1)
      expect(response).to have_http_status(:success)
    end
  end
end

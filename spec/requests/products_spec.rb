require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /api/v1/products" do
    FactoryBot.create_list(:product, 20)

    it "returns http success" do
      get "/api/v1/products"
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json['data'].length).to eq(15)
    end
  end

  describe "GET /api/v1/products/:id" do
    product = FactoryBot.create(:product)

    it "returns http success" do
      get "/api/v1/products/#{product.id}"
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json['data']['name']).to eq(product.name)
    end
  end

  describe "POST /api/v1/products" do
    it "creates a new product and returns http success" do
      valid_params = { name: "test", price: 10.0, category_id: 1 }

      expect { post '/api/v1/products', params: { product: valid_params } }.to change(Product, :count).by(+1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /api/v1/products/:id" do
    it "updates a product and returns http success" do
      category = FactoryBot.create(:category)
      product = FactoryBot.create(:product, category_id: category.id)

      put "/api/v1/products/#{product.id}", params: { product: { name: "updated!" } }
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json['data']['name']).to eq('updated!')
    end
  end

  describe "DELETE /api/v1/products/:id" do
    it "deletes a product and returns http success" do
      category = FactoryBot.create(:category)
      product = FactoryBot.create(:product, category_id: category.id)

      expect { delete "/api/v1/products/#{product.id}" }.to change(Product, :count).by(-1)
      expect(response).to have_http_status(:success)
    end
  end

end

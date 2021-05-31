require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /api/v1/orders" do
    FactoryBot.create_list(:order, 20)

    it "returns http success" do
      get "/api/v1/orders"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /api/v1/orders/:id" do
    order = FactoryBot.create(:order)

    it "returns http success" do
      get "/api/v1/orders/#{order.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /api/v1/orders" do
    it "returns http success" do
      valid_params = { order_number: 1001, order_type: :dine_in, order_date: Date.today, customer_name: "test", heads: 1, table: "A" }

      expect { post "/api/v1/orders", params: valid_params }.to change(Order, :count).by(+1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /api/v1/orders/:id" do
    order = FactoryBot.create(:order)

    it "returns http success" do
      put "/api/v1/orders/#{order.id}", params: { order_type: :to_go }
      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json['data']['order_type']).to eq('to_go')
    end
  end

  describe "DELETE /api/v1/orders/:id" do
    order = FactoryBot.create(:order)

    it "returns http success" do
      delete "/api/v1/orders/#{order.id}"
      expect(response).to have_http_status(:success)
    end
  end

end

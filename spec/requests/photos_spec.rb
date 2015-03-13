require 'rails_helper'

RSpec.describe "Photos", type: :request do
  describe "GET /photos" do
    it "works! (now write some real specs)" do
      product_id = Product.create!(name: "Fake").id
      get "/products/#{product_id}/photos.json"
      expect(response).to have_http_status(200)
      skip
    end
  end
end

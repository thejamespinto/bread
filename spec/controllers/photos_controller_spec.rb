require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  let(:product) { Product.create!(name: "Fake") }
  let(:product_id) { product.id }
  let(:photo) { photo = product.photos.create! }
  let(:valid_session)    { {} }

  describe "GET #index" do
    it "assigns all photos as @photos" do
      get :index, {:product_id => product_id}, valid_session
      expect(assigns(:photos)).to eq([photo])
    end
  end

  describe "GET #show" do
    it "assigns the requested photo as @photo" do
      get :show, {:product_id => product_id, :id => photo.to_param}, valid_session
      expect(assigns(:photo)).to eq(photo)
    end
  end

  describe "GET #new" do
    it "assigns a new photo as @photo" do
      get :new, {:product_id => product_id}, valid_session
      expect(assigns(:photo)).to be_a_new(Photo)
    end
  end

  describe "GET #edit" do
    it "assigns the requested photo as @photo" do
      get :edit, {:product_id => product_id, :id => photo.to_param}, valid_session
      expect(assigns(:photo)).to eq(photo)
    end
  end

  after { skip "now test the breadcrumbs" }


end

require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  let(:product) { Product.create!(name: "Fake") }
  let(:product_id) { product.id }
  let(:photo) { photo = product.photos.create!(name: "Smile") }
  let(:valid_session)    { {} }
  let(:invalid_attributes) { {name: "0"} }

  before { photo } # touch




  describe "GET #index" do
    context "assigns all photos as @photos" do
      it "Has Correct Breadcrumbs" do
        get :index, {:product_id => product_id}, valid_session
        expect(assigns(:photos)).to eq([photo])
        expect(bread_titles).to eq ["Home", "Products", "Fake", "Photos"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/photos"]
      end
    end
  end

  describe "GET #show" do
    context "assigns the requested photo as @photo" do
      it "Has Correct Breadcrumbs" do
        get :show, {:product_id => product_id, :id => photo.to_param}, valid_session
        expect(assigns(:photo)).to eq(photo)
        expect(bread_titles).to eq ["Home", "Products", "Fake", "Photos", "Smile"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/photos", "/products/1/photos/1"]
      end
    end
  end

  describe "GET #new" do
    context "assigns a new photo as @photo" do
      it "Has Correct Breadcrumbs" do
        get :new, {:product_id => product_id}, valid_session
        expect(assigns(:photo)).to be_a_new(Photo)
        expect(bread_titles).to eq ["Home", "Products", "Fake", "Photos", "New"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/photos", "/products/1/photos/new"]
      end
    end
  end

  describe "GET #edit" do
    context "assigns the requested photo as @photo" do
      it "Has Correct Breadcrumbs" do
        get :edit, {:product_id => product_id, :id => photo.to_param}, valid_session
        expect(assigns(:photo)).to eq(photo)
        expect(bread_titles).to eq ["Home", "Products", "Fake", "Photos", "Smile", "Edit"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/photos", "/products/1/photos/1", "/products/1/photos/1/edit"]
      end
    end
  end

  describe "POST #create with invalid params" do
    context "assigns a newly created but unsaved photo as @photo" do
      it "Has Correct Breadcrumbs" do
        post :create, {:product_id => product_id, :photo => invalid_attributes}, valid_session
        expect(assigns(:photo)).to be_a_new(Photo)
        expect(bread_titles).to eq ["Home", "Products", "Fake", "Photos", "New"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/photos", "/products/1/photos/new"]
      end
    end
  end

  describe "PUT #update with invalid params" do
    context "assigns the photo as @photo" do
      it "Has Correct Breadcrumbs" do
        put :update, {:product_id => product_id, :id => photo.to_param, :photo => invalid_attributes}, valid_session
        expect(assigns(:photo)).to eq(photo)
        expect(bread_titles).to eq ["Home", "Products", "Fake", "Photos", "0", "Edit"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/photos", "/products/1/photos/1", "/products/1/photos/1/edit"]
      end
    end
  end

  describe "DELETE #destroy" do
    context "cannot destroys the requested photo" do
      it "Has Correct Breadcrumbs" do
        expect {
          delete :destroy, {:product_id => product_id, :id => photo.to_param}, valid_session
        }.not_to change(Photo, :count).from(1)
        expect(bread_titles).to eq ["Home", "Products", "Fake", "Photos", "Smile", "Edit"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/photos", "/products/1/photos/1", "/products/1/photos/1/edit"]
      end
    end
  end

end

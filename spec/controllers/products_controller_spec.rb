require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:invalid_attributes) { {name: "0"} }
  let(:product) { Product.create! name: "Fake" }
  let(:valid_session)    { {} }

  before { product } # touch



  describe "GET #index" do
    context "assigns all products as @products" do
      render_views

      it "Has Correct Breadcrumbs On Controller And View" do
        get :index, {}, valid_session
        expect(assigns(:products)).to eq([product])
        expect(bread_titles).to eq ["Home", "Products"]
        expect(bread_paths).to eq [:root, "/products"]
        expect(response.body).to match /<ul id="breadcrumbs">/
      end
    end
  end

  describe "GET #show" do
    context "assigns the requested product as @product" do
      it "Has Correct Breadcrumbs" do
        get :show, {:id => product.to_param}, valid_session
        expect(assigns(:product)).to eq(product)
        expect(bread_titles).to eq ["Home", "Products", "Fake"]
        expect(bread_paths).to eq [:root, "/products", "/products/1"]
      end
    end
  end

  describe "GET #new" do
    context "assigns a new product as @product" do
      it "Has Correct Breadcrumbs" do
        get :new, {}, valid_session
        expect(assigns(:product)).to be_a_new(Product)
        expect(bread_titles).to eq ["Home", "Products", "New"]
        expect(bread_paths).to eq [:root, "/products", "/products/new"]
      end
    end
  end

  describe "GET #edit" do
    context "assigns the requested product as @product" do
      it "Has Correct Breadcrumbs" do
        get :edit, {:id => product.to_param}, valid_session
        expect(assigns(:product)).to eq(product)
        expect(bread_titles).to eq ["Home", "Products", "Fake", "Edit"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/edit"]
      end
    end
  end

  describe "POST #create with invalid params" do
    context "assigns a newly created but unsaved product as @product" do
      it "Has Correct Breadcrumbs" do
        post :create, {:product => invalid_attributes}, valid_session
        expect(assigns(:product)).to be_a_new(Product)
        expect(bread_titles).to eq ["Home", "Products", "New"]
        expect(bread_paths).to eq [:root, "/products", "/products/new"]
      end
    end
  end

  describe "PUT #update with invalid params" do
    context "assigns the product as @product" do
      it "Has Correct Breadcrumbs" do
        put :update, {:id => product.to_param, :product => invalid_attributes}, valid_session
        expect(assigns(:product)).to eq(product)
        expect(bread_titles).to eq ["Home", "Products", "0", "Edit"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/edit"]
      end
    end
  end

  describe "DELETE #destroy" do
    context "cannot destroys the requested product" do
      it "Has Correct Breadcrumbs" do
        expect {
          delete :destroy, {:id => product.to_param}, valid_session
        }.not_to change(Product, :count).from(1)
        expect(bread_titles).to eq ["Home", "Products", "Fake", "Edit"]
        expect(bread_paths).to eq [:root, "/products", "/products/1", "/products/1/edit"]
      end
    end
  end

end

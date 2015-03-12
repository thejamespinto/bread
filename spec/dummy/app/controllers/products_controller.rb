

class ProductsController < ApplicationController

  # Use callbacks to share common setup or constraints between actions.
  before_actions do
    # all                                   {  } # pre-fetching authorization step
    # all                                   {  } # load your nested resource's parent here
    only(:index)                          { @products = Product.all                }
    only(:new)                            { @product  = Product.new                }
    only(:create)                         { @product  = Product.new(product_params) }
    only(:show, :edit, :update, :destroy) { @product  = Product.find(params[:id])  }
    # all                                   {  } # post-fetching authorization step
  end

  # GET /products
  # GET /products.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end




  # GET /products/new
  def new
  end

  # POST /products
  # POST /products.json
  def create
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end





  # GET /products/1
  # GET /products/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1
  def destroy
    respond_to do |format|
      if @product.destroy
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :category_id)
    end
end


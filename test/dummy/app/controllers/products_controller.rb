class ProductsController < ApplicationController
  # Use callbacks to share common setup or constraints between actions.
  before_actions do
    actions(:new, :create)                   { @product = Product.new(product_params) }
    actions(:show, :edit, :update, :destroy) { @product = Product.find(params[:id])  }
  end


  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/category/1
  def by_category
    @category = params[:category]
    @products = Product.where(category: params[:category])
    render :index
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    if @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
    else
      render action: 'edit'
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def product_params
      if params[:product]
        params.require(:product).permit(:name, :category)
      else
        {}
      end
    end
end

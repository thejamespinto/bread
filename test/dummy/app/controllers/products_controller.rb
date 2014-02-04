class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]



  bread do
    # alias_actions :new,   :create
    # alias_actions :edit,  :update, :destroy

    actions(:index)          { crumbs :root, :all_products,   parent: nil    }
      actions(:new, :create) { crumbs :make_product,          parent: :index, lala: 1, lele: 2, lili: 3434 }
      actions(:by_category)  { crumbs :products_by_category,  parent: :index }
        actions(:show)    do
                            parent = @category.present? ? :by_category : :index
                            crumbs(:view_product, parent: parent)
                          end
          actions(:edit)         { crumbs :change_product, parent: :show }
          actions(:timeline)     { crumbs :product_timeline, parent: :show }
  end




  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
    @category = "lalala"
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
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :category)
    end
end

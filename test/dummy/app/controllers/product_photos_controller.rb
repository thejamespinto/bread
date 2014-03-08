class ProductPhotosController < ApplicationController
  # Use callbacks to share common setup or constraints between actions.
  before_actions do
    actions                                  { @product = Product.find(params[:product_id]) }
    actions(:index)                          { @product_photos = @product.product_photos                }
    actions(:new, :create)                   { @product_photo  = @product.product_photos.build(product_photo_params) }
    actions(:show, :edit, :update, :destroy) { @product_photo  = @product.product_photos.find(params[:id])  }
  end

  # GET /product_photos
  def index
  end

  # GET /product_photos/1
  def show
  end

  # GET /product_photos/new
  def new
  end

  # GET /product_photos/1/edit
  def edit
  end

  # POST /product_photos
  def create
    if @product_photo.save
      redirect_to [@product, @product_photo], notice: 'Product photo was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /product_photos/1
  def update
    if @product_photo.update(product_photo_params)
      redirect_to [@product, @product_photo], notice: 'Product photo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /product_photos/1
  def destroy
    if @product_photo.destroy
      redirect_to product_product_photos_url, notice: 'Product photo was successfully destroyed.'
    else
      render action: 'edit'
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def product_photo_params
      if params[:product_photo]
        params.require(:product_photo).permit(:name, :order)
      else
        {}
      end
    end
end

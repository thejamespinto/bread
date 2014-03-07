class ProductPhotosController < ApplicationController
  before_action :set_product
  before_action :set_product_photo, only: [:show, :edit, :update, :destroy]

  # GET /product_photos
  def index
    @product_photos = @product.product_photos
  end

  # GET /product_photos/1
  def show
  end

  # GET /product_photos/new
  def new
    @product_photo = @product.product_photos.build
  end

  # GET /product_photos/1/edit
  def edit
  end

  # POST /product_photos
  def create
    @product_photo = @product.product_photos.build(product_photo_params)

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
    # Use callbacks to share common setup or constraints between actions.

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_product_photo
      @product_photo = @product.product_photos.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_photo_params
      params.require(:product_photo).permit(:product_id, :name, :order)
    end
end



class PhotosController < ApplicationController

  # Use callbacks to share common setup or constraints between actions.
  before_actions do
    all                                   { @product = Product.find(params[:product_id])  }
    only(:index)                          { @photos = @product.photos                     }
    only(:new)                            { @photo  = @product.photos.build               }
    only(:create)                         { @photo  = @product.photos.build(photo_params) }
    only(:show, :edit, :update, :destroy) { @photo  = @product.photos.find(params[:id])   }
  end

  # GET /photos
  # GET /photos.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end




  # GET /photos/new
  def new
  end

  # POST /photos
  # POST /photos.json
  def create
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end





  # GET /photos/1
  # GET /photos/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1
  def destroy
    respond_to do |format|
      if @photo.destroy
        format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:product_id)
    end
end


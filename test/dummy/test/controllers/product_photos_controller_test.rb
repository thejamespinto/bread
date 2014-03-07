require 'test_helper'

class ProductPhotosControllerTest < ActionController::TestCase
  setup do
    @product = Product.create(name: "aaa", category: "Awesome")
    @product_photo = @product.product_photos.create(name: "bbb", order: 1)
  end

  test "should get index" do
    get :index, product_id: @product
    assert_response :success
    assert_not_nil assigns(:product_photos)
    # bread
    assert_crumb "Products"
    assert_crumb @product.name
    assert_crumb "Photos"
  end

      test "should get new" do
        get :new, product_id: @product
        assert_response :success
        # bread
        assert_crumb "Products"
        assert_crumb @product.name
        assert_crumb "Photos"
        assert_crumb "New"
      end

          test "should create product_photo" do
            assert_difference('ProductPhoto.count') do
              post :create, product_id: @product, product_photo: { name: @product_photo.name, order: @product_photo.order }
            end

            assert_redirected_to product_product_photo_path(@product, assigns(:product_photo))
          end

              test "shouldnt create product_photo" do
                assert_no_difference('ProductPhoto.count') do
                  post :create, product_id: @product, product_photo: { name: '', order: @product_photo.order }
                end

                assert_response :success
                assert_template :new
                # bread
                assert_crumb "Home"
                assert_crumb "Products"
                assert_crumb @product.name
                assert_crumb "Photos"
                assert_crumb "New"
              end

      test "should show product_photo" do
        get :show, product_id: @product, id: @product_photo
        assert_response :success
        # bread
        assert_crumb "Products"
        assert_crumb @product.name
        assert_crumb "Photos"
        assert_crumb @product_photo.name
      end

          test "should get edit" do
            get :edit, product_id: @product, id: @product_photo
            assert_response :success
            # bread
            assert_crumb "Products"
            assert_crumb @product.name
            assert_crumb "Photos"
            assert_crumb @product_photo.name
            assert_crumb "Edit"
          end

              test "should update product_photo" do
                patch :update, product_id: @product, id: @product_photo, product_photo: { name: @product_photo.name, order: @product_photo.order }
                assert_redirected_to product_product_photo_path(@product, assigns(:product_photo))
              end

                  test "shouldnt update product_photo" do
                    patch :update, product_id: @product, id: @product_photo, product_photo: { name: '', order: @product_photo.order }

                    assert_response :success
                    assert_template :edit
                    # bread
                    assert_crumb "Products"
                    assert_crumb @product.name
                    assert_crumb "Photos"
                    assert_crumb @product_photo.name
                    assert_crumb "Edit"
                  end

              test "should destroy product_photo" do
                assert_difference('ProductPhoto.count', -1) do
                  delete :destroy, product_id: @product, id: @product_photo
                end

                assert_redirected_to product_product_photos_path
              end
end

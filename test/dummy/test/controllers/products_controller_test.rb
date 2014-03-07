# http://rubydoc.info/github/rack/rack/master/Rack/Utils#HTTP_STATUS_CODES-constant

require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = Product.create(name: "aaa", category: "Awesome")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    # bread
    assert_crumb "Home"
    assert_crumb "Products"
  end

      test "should get new" do
        get :new
        assert_response :success
        # bread
        assert_crumb "Home"
        assert_crumb "Products"
        assert_crumb "New"
      end

          test "should create product" do
            assert_difference('Product.count') do
              post :create, product: { category: @product.category, name: @product.name }
            end

            assert_redirected_to product_path(assigns(:product))
          end

              test "shouldnt create product" do
                assert_no_difference('Product.count') do
                  post :create, product: {name: ''}
                end

                assert_response :success
                assert_template :new
                # bread
                assert_crumb "Home"
                assert_crumb "Products"
                assert_crumb "New"
              end


      test "should get by_category" do
        get :by_category, category: @product.category
        assert_response :success
        assert_not_nil assigns(:products)
        # bread
        assert_crumb "Products"
        assert_crumb @product.category
      end

          test "should show product" do
            get :show, id: @product
            assert_response :success
            # bread
            assert_crumb "Products"
            assert_crumb @product.category
            assert_crumb @product.name
          end

              test "should get edit" do
                get :edit, id: @product
                assert_response :success
                # bread
                assert_crumb "Products"
                assert_crumb @product.name
                assert_crumb "Edit"
              end

                  test "should update product" do
                    patch :update, id: @product, product: { category: @product.category, name: @product.name }
                    assert_redirected_to product_path(assigns(:product))
                  end

                      test "shouldnt update product" do
                        patch :update, id: @product, product: {name: ''}
                        
                        assert_response :success
                        assert_template :edit
                        # bread
                        assert_crumb "Products"
                        assert_crumb @product.name
                        assert_crumb "Edit"
                      end

                  test "should destroy product" do
                    assert_difference('Product.count', -1) do
                      delete :destroy, id: @product
                    end

                    assert_redirected_to products_path
                  end

                      test "shouldnt destroy product" do
                        @product.product_photos.create(name: "aaa")
                        assert_no_difference('Product.count') do
                          delete :destroy, id: @product
                        end

                        assert_response :success
                        assert_template :edit
                        # bread
                        assert_crumb "Products"
                        assert_crumb @product.name
                        assert_crumb "Edit"
                      end
end

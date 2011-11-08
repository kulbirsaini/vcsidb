require 'test_helper'

class PaymentGatewaysControllerTest < ActionController::TestCase
  setup do
    @payment_gateway = payment_gateways(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_gateways)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_gateway" do
    assert_difference('PaymentGateway.count') do
      post :create, payment_gateway: @payment_gateway.attributes
    end

    assert_redirected_to payment_gateway_path(assigns(:payment_gateway))
  end

  test "should show payment_gateway" do
    get :show, id: @payment_gateway.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_gateway.to_param
    assert_response :success
  end

  test "should update payment_gateway" do
    put :update, id: @payment_gateway.to_param, payment_gateway: @payment_gateway.attributes
    assert_redirected_to payment_gateway_path(assigns(:payment_gateway))
  end

  test "should destroy payment_gateway" do
    assert_difference('PaymentGateway.count', -1) do
      delete :destroy, id: @payment_gateway.to_param
    end

    assert_redirected_to payment_gateways_path
  end
end

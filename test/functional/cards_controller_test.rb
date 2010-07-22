require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post :create, :card => { }
    end

    assert_redirected_to card_path(assigns(:card))
  end

  test "should show card" do
    get :show, :id => cards(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cards(:one).to_param
    assert_response :success
  end

  test "should update card" do
    put :update, :id => cards(:one).to_param, :card => { }
    assert_redirected_to card_path(assigns(:card))
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete :destroy, :id => cards(:one).to_param
    end

    assert_redirected_to cards_path
  end
end

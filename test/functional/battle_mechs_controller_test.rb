require 'test_helper'

class BattleMechsControllerTest < ActionController::TestCase
  setup do
    @battle_mech = battle_mechs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battle_mechs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battle_mech" do
    assert_difference('BattleMech.count') do
      post :create, :battle_mech => @battle_mech.attributes
    end

    assert_redirected_to battle_mech_path(assigns(:battle_mech))
  end

  test "should show battle_mech" do
    get :show, :id => @battle_mech.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @battle_mech.to_param
    assert_response :success
  end

  test "should update battle_mech" do
    put :update, :id => @battle_mech.to_param, :battle_mech => @battle_mech.attributes
    assert_redirected_to battle_mech_path(assigns(:battle_mech))
  end

  test "should destroy battle_mech" do
    assert_difference('BattleMech.count', -1) do
      delete :destroy, :id => @battle_mech.to_param
    end

    assert_redirected_to battle_mechs_path
  end
end

require 'test_helper'

class InviteItemsControllerTest < ActionController::TestCase
  setup do
    @invite_item = invite_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invite_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invite_item" do
    assert_difference('InviteItem.count') do
      post :create, invite_item: { description: @invite_item.description, title: @invite_item.title, url: @invite_item.url }
    end

    assert_redirected_to invite_item_path(assigns(:invite_item))
  end

  test "should show invite_item" do
    get :show, id: @invite_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invite_item
    assert_response :success
  end

  test "should update invite_item" do
    put :update, id: @invite_item, invite_item: { description: @invite_item.description, title: @invite_item.title, url: @invite_item.url }
    assert_redirected_to invite_item_path(assigns(:invite_item))
  end

  test "should destroy invite_item" do
    assert_difference('InviteItem.count', -1) do
      delete :destroy, id: @invite_item
    end

    assert_redirected_to invite_items_path
  end
end

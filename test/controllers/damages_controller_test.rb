require 'test_helper'

class DamagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @damage = damages(:one)
  end

  test "should get index" do
    get damages_url, as: :json
    assert_response :success
  end

  test "should create damage" do
    assert_difference('Damage.count') do
      post damages_url, params: { damage: { hp: @damage.hp } }, as: :json
    end

    assert_response 201
  end

  test "should show damage" do
    get damage_url(@damage), as: :json
    assert_response :success
  end

  test "should update damage" do
    patch damage_url(@damage), params: { damage: { hp: @damage.hp } }, as: :json
    assert_response 200
  end

  test "should destroy damage" do
    assert_difference('Damage.count', -1) do
      delete damage_url(@damage), as: :json
    end

    assert_response 204
  end
end

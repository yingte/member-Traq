# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # before do
  #   @user = users(:one)
  # end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    @user = users(:one)
    assert_difference('User.count') do
      post users_url,
           params: {
             user: {
               email: @user.email,
               first_name: @user.first_name,
               graduation_year: @user.graduation_year,
               last_name: @user.last_name,
               major: @user.major,
               phone: @user.phone,
               role_id: @user.role_id
             }
           }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should show user' do
    @user = users(:one)
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    @user = users(:one)
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    @user = users(:one)
    patch user_url(@user),
          params: {
            user: {
              email: @user.email,
              first_name: @user.first_name,
              graduation_year: @user.graduation_year,
              last_name: @user.last_name,
              major: @user.major,
              phone: @user.phone,
              role_id: @user.role_id
            }
          }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user' do
    @user = users(:one)
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end

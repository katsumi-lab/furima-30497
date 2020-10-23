class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create]
  before_action :basic_auth

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end

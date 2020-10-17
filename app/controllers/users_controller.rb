class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create]

end

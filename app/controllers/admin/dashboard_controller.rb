class Admin::DashboardController < ApplicationController
  #basic http authentication with our .env file
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def show
  end
end

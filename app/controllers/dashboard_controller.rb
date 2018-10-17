class DashboardController < ApplicationController
  def index
  end

  def start
    @phones = User.all.pluck(:phone)
  end
end

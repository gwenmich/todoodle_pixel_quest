class HomeController < ApplicationController
  def index
    @quests = @user.quests.where(completed: false).includes(:tasks).order(created_at: :desc)
  end
end

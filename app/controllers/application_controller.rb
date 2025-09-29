class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :ensure_user

  private
  def ensure_user
    @user = User.first_or_create!(name: "Adventurer")
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?
  before_action :banned?
  before_action :see_user

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || profile_path || root_path
  end

  private

  def banned?
    return unless current_user.present? && current_user.banned?
    sign_out current_user
    flash[:error] = 'This account has been suspended'
    root_path
  end

  def see_user
    current_user&.touch(:last_seen)
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def storable_location?
    request.get? &&
      is_navigational_format? &&
      !devise_controller? &&
      !request.xhr?
  end

  def profile_path
    return unless current_user.has_profile?
    profile_home_path(username: current_user.profile.username)
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    user_type = resource.user_type.try(:name)
    unless resource.user_detail
      '/user_profile/edit'
    else
      if user_type == "scribe_requester"
        '/requests'
      elsif user_type == "scribe_volunteer"
        '/user_profile/show'
      else
        '/requests'
      end
    end
  end
end

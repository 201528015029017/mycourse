class TestcController < ApplicationController
  def home
  end

  def help
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.respond_to?(:blocked?) && resource.blocked?
      sign_out resource
      flash[:alert] = "Your account is blocked. Retry when an admin has unblocked it."
      new_user_session_path
    else
      stored_location_for(:redirect) || stored_location_for(resource) || root_path
    end
  end

  def after_sign_out_path_for(resource)
    current_application_settings.after_sign_out_path || new_user_session_path
  end

  def abilities
    Ability.abilities
  end

  def can?(object, action, subject)
    abilities.allowed?(object, action, subject)
  end


end

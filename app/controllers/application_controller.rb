# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Employee
      kudos_path
    when AdminUser
      dashboard_admin_pages_path
    end
  end
end

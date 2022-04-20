module Admin
  class PagesController < ApplicationController
    before_action :authenticate_admin_user!
  end
end

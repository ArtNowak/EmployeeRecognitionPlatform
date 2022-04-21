module Admin
  class PagesController < ApplicationController
    before_action :authenticate_admin_user!
    before_action :set_kudo, only: %i[dashboard destroy]

    def dashboard
      @kudos = Kudo.all
    end

    def destroy
      @kudo.destroy
      redirect_to dashboard_admin_pages_path, notice: 'Kudo was successfully destroyed.'
    end

    private

    def set_kudo
      @kudo = Kudo.find_by(params[:kudo_id])
    end
  end
end

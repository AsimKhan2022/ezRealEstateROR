class PortalPageController < ApplicationController
  skip_before_action :authenticate_admin!, only: :landing_page

  def landing_page; end

  def dashboard
    render layout: 'dashboard'
  end
end

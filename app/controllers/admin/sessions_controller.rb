class Admin::SessionsController < Devise::SessionsController
  include AuthorizedController

  before_action :authenticate_admin!
  before_action :set_admin, only: [:create]
  before_action :redirect_if_signed_in, except: [:destroy]

  def create
    super do |_admin|
      if admin_signed_in?

        admin_id = @admin.id
        puts "Signed in Admin ID: #{admin_id}"

        if @admin.sign_in_count == 1
          @admin.start_trial
        elsif !@admin.trial_active? && !@admin.subscription_active?
          redirect_to new_subscription_path and return
        elsif @admin.subscription_expiring_soon?
          @subscription_expiring_soon = true
        end
      end
    end
  end



  private

  def redirect_if_signed_in
    redirect_to dashboard_path if admin_signed_in?
  end
end

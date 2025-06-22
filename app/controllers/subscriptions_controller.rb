class SubscriptionsController < ApplicationController
  include AuthorizedController

  before_action :authenticate_admin!
  before_action :set_admin

  def new
    admin_id = @admin.id
    puts "Admin ID on creation: #{admin_id}"
    @policies = Admin::POLICIES
  end

  # rubocop:disable Metrics/MethodLength
  def create
    admin_id = @admin.id
    puts "Admin ID when creating: #{admin_id}"

    selected_policy = Admin::POLICIES.find { |policy| policy[:name] == params[:subscription_type] }
    if selected_policy
      begin
        if @admin.update(
          subscription_type: selected_policy[:name],
          subscription_start_date: Date.today,
          subscription_end_date: Date.today + selected_policy[:duration]
        )
          redirect_to root_path, notice: 'Subscription successfully created.'
        else
          puts "Validation errors: #{@admin.errors.full_messages.join(', ')}"
          redirect_to new_subscription_path, alert: 'Failed to create subscription.'
        end
      rescue StandardError => e
        puts "Exception during update: #{e.message}"
        redirect_to new_subscription_path, alert: 'An error occurred while creating the subscription.'
      end
    else
      redirect_to new_subscription_path, alert: 'Invalid subscription type.'
    end

    admin_id = @admin.id
    puts "Admin ID after creating: #{admin_id}"
  end
  # rubocop:enable Metrics/MethodLength

  def renew
    admin_id = @admin.id
    puts "Admin ID on renewal: #{admin_id}"
    @policies = Admin::POLICIES
  end

  def update
    admin_id = @admin.id
    puts "Admin ID when updating: #{admin_id}"

    selected_policy = Admin::POLICIES.find { |policy| policy[:name] == params[:subscription_type] }
    if selected_policy
      new_end_date = @admin.subscription_end_date || Date.today
      if @admin.update(
        subscription_type: selected_policy[:name],
        subscription_start_date: Date.today,
        subscription_end_date: new_end_date + selected_policy[:duration]
      )
        redirect_to root_path, notice: 'Subscription successfully renewed.'
      else
        puts "Validation errors: #{@admin.errors.full_messages.join(', ')}"
        redirect_to renew_subscriptions_path, alert: 'Failed to renew subscription.'
      end
    else
      redirect_to renew_subscriptions_path, alert: 'Invalid subscription type.'
    end

    admin_id = @admin.id
    puts "Admin ID when updated: #{admin_id}"
  end
end

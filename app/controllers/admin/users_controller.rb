class Admin::UsersController < ApplicationController
  include AuthorizedController
  layout 'dashboard'

  before_action :authenticate_admin!
  before_action :set_admin
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  def index
    @users = @admin.users
  end

  def show
    @user = @admin.users.find(params[:id])
  end

  def new
    @user = @admin.users.build
  end

  def edit
    @user = @admin.users.find(params[:id])
  end

  def create
    @user = @admin.users.build(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    @user = @admin.users.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :mobile, :telephone, :whatsapp, :address, :state, :city, :country, :phase, :sector, :street_number,
                                 :role, :email, :secondary_email, :password, :password_confirmation)
  end
end

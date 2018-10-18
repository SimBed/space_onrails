class PackagesController < ApplicationController
  before_action :admin_user, only: [:create, :destroy]

  def create
    @package = User.find(params[:package][:member]).packages.build(package_params)
    if @package.save
      flash[:success] = "Package created!"
      redirect_to @package.user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @user=User.find(session[:member_id])
    Package.find(params[:id]).destroy
    flash[:success] = "Package deleted"
    redirect_to @user
  end

  private

    def package_params
      params.require(:package).permit(:name, :instructor, :purchased_on, :classes)
    end
end

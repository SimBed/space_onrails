class PackagesController < ApplicationController
  before_action :admin_user, only: [:create, :destroy]

  def create
   session[:testperiod] = params[:package][:testperiod]
    @package = User.find(params[:package][:member]).packages.build(package_params)
    if @package.save
      flash[:success] = "Package created!"
      redirect_to @package.user
    else
     flash[:warning] = "Package not created!"
      redirect_to @package.user
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
      params.require(:package).permit(:testperiod, :name, :instructor, :purchased_on, :classes, :validity_type, :validity_period)
    end
end

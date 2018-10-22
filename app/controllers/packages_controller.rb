class PackagesController < ApplicationController
  before_action :admin_user, only: [:create, :destroy, :update]

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
  
  def update

    @user=User.find(session[:member_id])
    @package = Package.find(params[:id])
       
    params[:package][:classes_taken] = params[:package][:classes_taken].split(',')

    if @package.update_attributes(package_params)
     flash[:success] = "Class added!"
     redirect_to @package.user
    else
    flash[:warning] = "Class not added!"
      redirect_to @user
    end
  end

  private

    def package_params
      #https://stackoverflow.com/questions/21683219/using-update-attributes-with-column-type-of-array
      params.require(:package).permit(:name, :instructor, :purchased_on, :classes,{:classes_taken => []})
    end
end

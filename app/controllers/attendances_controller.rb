class AttendancesController < ApplicationController
  before_action :admin_user, only: [:create, :destroy]

  def create
    @attendance = Package.find(params[:attendance][:members_package]).attendances.build(attendance_params)
#     @attendance = @pac.attendances.build(package_params)
    if @attendance.save
      flash[:success] = "Attendance created!"
      redirect_to @attendance.package.user
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
    @user=User.find(session[:member_id])
    Attendance.find(params[:id]).destroy
    flash[:success] = "Attendance deleted"
    redirect_to @user
  end

  private

    def attendance_params
      params.require(:attendance).permit(:date)
    end
end

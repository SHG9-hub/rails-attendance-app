class AttendancesController < ApplicationController
  def index
    @attendances = current_user.attendances.order(created_at: :desc)
  end

  def create
    @attendance = current_user.attendances.create(check_in: Time.current)
    redirect_to root_path, notice: '出勤時間を記録しました'
  end

  def update
    @attendance = current_user.attendances.find(params[:id])
    @attendance.update(check_out: Time.current)
    redirect_to root_path, notice: '退勤時間を記録しました'
  end

  def destroy
    @attendance = current_user.attendances.find(params[:id])
    @attendance.destroy
    redirect_to root_path, notice: '勤怠記録を削除しました'
  end
end

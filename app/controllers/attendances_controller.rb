class AttendancesController < ApplicationController
  before_action :set_user

  # 出勤打刻
  def create
    @attendance = @user.attendances.new(attendance_params)

    if @attendance.save
      redirect_to user_path(@user), notice: "出勤打刻が成功しました。"
    else
      render :new
    end
  end

  # 退勤打刻
  def update
    @attendance = @user.attendances.order(updated_at: :desc).first # 最新の勤怠を取得
  
    if @attendance.update(check_out: Time.current) # 退勤時刻を自動設定
      flash[:notice] = "退勤が記録されました"
    else
      flash[:alert] = "退勤の記録に失敗しました"
    end
    redirect_to user_path(@user)
  end


  private

  # ユーザーを設定するメソッド
  def set_user
    @user = User.find(params[:user_id])  # URLからユーザーIDを取得
  end

  # アテンダンスのパラメータを許可するメソッド
  def attendance_params
    params.require(:attendance).permit(:check_in, :check_out)  # 出勤時間と退勤時間を許可
  end
end
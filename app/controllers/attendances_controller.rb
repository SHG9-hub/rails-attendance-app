class AttendancesController < ApplicationController
  before_action :set_user

    # 出勤打刻
  def new
    @attendance = @user.attendances.new
  end

  def create
    @attendance = @user.attendances.new(attendance_params)

    if @attendance.save
      redirect_to user_path(@user), notice: "出勤打刻が成功しました。"
    else
      render :new
    end
  end

  # 退勤打刻
  def edit
    @attendance = @user.attendances.find_by(id: params[:id])
  end

  def update
    @attendance = @user.attendances.find_by(id: params[:id])
    if @attendances.update(attendance_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
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
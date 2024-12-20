class AttendancesController < ApplicationController
    
    def new
        @user  = User.find(params[:user_id])                         # ユーザーの個人的なデータをとってくる。
        @attendance =  Attendance.new
    end

    def create
        @user = User.find(params[:user_id])
        @attendance = @user.attendances.new(attendance_params)  # パラメータを設定
    
        if @attendance.save
            redirect_to user_path(@user), notice: "打刻が成功しました。"  # 成功時はリダイレクト
        else
            render :new  # 失敗時は新規作成フォームを再表示
        end
    end
    
    private
    
    def attendance_params
        params.require(:attendance).permit(:check_in, :check_out)  # 必要なパラメータを許可
    end
end


# 作るものとコントローラーはある程度一致する、という認識でOK。
# 今回は「ユーザー」の「アテンダンス」の情報を作るので、アテンダンスコントローラーにクリエイトメソッドを記述。
class AttendancesController < ApplicationController
    
    def new
        @user  = User.find(params[:user_id])                         # ユーザーの個人的なデータをとってくる。
        @attendance =  Attendance.new
    end

end


# 作るものとコントローラーはある程度一致する、という認識でOK。
# 今回は「ユーザー」の「アテンダンス」の情報を作るので、アテンダンスコントローラーにクリエイトメソッドを記述。
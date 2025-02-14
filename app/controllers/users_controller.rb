class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @attendances = @user.attendances  # ユーザーのアテンダンスを取得
  end

end

  # このユーザーコンロローラーではrailsの７つのアクションのうち、２しか使用していないが
  # これはC,N,はデバイスによって作られるためである。それをそのまま借用している。
  # そして、残りの3つ（E ,U,D)に関しては権限アクセスなどで適宜追加してゆくものとする。





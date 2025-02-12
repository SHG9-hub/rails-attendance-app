class User < ApplicationRecord
  has_many :attendances
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # 指定された年と月のAttendanceを取得するインスタンスメソッド
  def attendances_for_month(year, month)
    # SQLiteのstrftime関数を使用して、check_inの日付から年と月を抽出して比較
    attendances.where("user_id = ? AND strftime('%Y', check_in) = ? AND strftime('%m', check_in) = ?", self.id, year.to_s, month.to_s.rjust(2, '0'))
  end


end

# モデルファイルに記述する内容は、バリデイトとフィールド。

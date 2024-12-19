class User < ApplicationRecord
  has_many :attendances
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# モデルファイルに記述する内容は、バリデイトとフィールド。

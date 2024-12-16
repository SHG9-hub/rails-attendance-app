class User < ApplicationRecord
  has_many :attendances
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

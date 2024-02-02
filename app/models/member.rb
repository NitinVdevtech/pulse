class Member < ApplicationRecord
  has_many :opportunities
  # has_one_attached :avatar

  enum role: { patient: '0', doctor: '1' }
  enum gender: { male: '0', female: '1' }

  validates :first_name, :last_name, :gender, :age, :role, presence: true
end

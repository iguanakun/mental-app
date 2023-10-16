class User < ApplicationRecord
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :monitorings
  has_many :temptations
end

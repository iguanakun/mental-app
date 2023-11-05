class NegativeFeel < ApplicationRecord
  has_many :monitoring_negative_feels, dependent: :destroy
  has_many :monitorings, through: :monitoring_negative_feels

  validates :negative_feel_name,  uniqueness: true
end

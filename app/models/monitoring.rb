class Monitoring < ApplicationRecord
  # validate :required_either_columns
  has_many :monitoring_tag_relations
  has_many :tags, through: :monitoring_tag_relations
  belongs_to :user
  encrypts :fact, :mind, :feel, :body, :behavior

  def self.search(search)
    if search != ""
      Monitoring.where('fact LIKE(?)', "%#{search}%")
    else
      Monitoring.includes(:user)
    end
  end
  
  # private

  # def required_either_columns
  #   return if fact.present? || mind.present? || feel.present? || body.present? || behavior.present?
  #   errors.add(:base, 'Data is invalid')
  # end
end

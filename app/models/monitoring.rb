class Monitoring < ApplicationRecord
  # validate :required_either_columns
  has_many :monitoring_tag_relations, dependent: :destroy
  has_many :tags, through: :monitoring_tag_relations
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :feel
  belongs_to :distortion

  encrypts :title, :fact, :mind, :why_correct, :why_doubt, :new_thought

  # def self.search(search)
  #   if search != ""
  #     Monitoring.where('fact LIKE(?)', "%#{search}%")
  #   else
  #     Monitoring.includes(:user)
  #   end
  # end
  
  def self.ransackable_attributes(auth_object = nil)
    ["fact"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["tags"]
  end

  # private

  # def required_either_columns
  #   return if fact.present? || mind.present? || feel.present? || body.present? || behavior.present?
  #   errors.add(:base, 'Data is invalid')
  # end
end

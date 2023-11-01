class Monitoring < ApplicationRecord
  has_many :monitoring_tag_relations, dependent: :destroy
  has_many :tags, through: :monitoring_tag_relations
  belongs_to :user

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
end

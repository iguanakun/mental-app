class Tag < ApplicationRecord
  has_many :monitoring_tag_relations, dependent: :destroy
  has_many :monitorings, through: :monitoring_tag_relations
  has_many :temptation_tag_relations, dependent: :destroy
  has_many :temptations, through: :temptation_tag_relations
  belongs_to :user

  validates :tag_name,  uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["tag_name"]
  end
end

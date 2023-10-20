class Tag < ApplicationRecord
  has_many :monitoring_tag_relations
  has_many :monitorings, through: :monitoring_tag_relations
  has_many :temptation_tag_relations
  has_many :temptations, through: :temptation_tag_relations
  belongs_to :user

  validates :tag_name,  uniqueness: true
end

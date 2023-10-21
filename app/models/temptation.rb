class Temptation < ApplicationRecord
  has_many :temptation_tag_relations, dependent: :destroy
  has_many :tags, through: :temptation_tag_relations
  belongs_to :user
  encrypts :event, :talk, :cost, :get_out
end

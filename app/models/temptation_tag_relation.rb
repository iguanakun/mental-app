class TemptationTagRelation < ApplicationRecord
  belongs_to :temptation
  belongs_to :tag
end

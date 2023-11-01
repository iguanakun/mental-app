class MonitoringDistortionRelation < ApplicationRecord
  belongs_to :monitoring
  belongs_to :distortion_list
end

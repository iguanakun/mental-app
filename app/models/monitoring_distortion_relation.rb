class MonitoringDistortionRelation < ApplicationRecord
  belongs_to :monitoring
  belongs_to :distortion_list

  def self.distortion_max_count(user_id)
    # 特定のユーザーに関連づけられたmonitoring_idの最大値を取得
    max_monitoring_ids = Monitoring.where(user_id: user_id).pluck(:id)

    # 特定のユーザーに関連づけられたmonitoring_idと一致するレコードをフィルタリング
    relevant_records = where(monitoring_id: max_monitoring_ids)

    # distortion_list_idごとの出現回数をカウントして、降順でソート
    dist_id_counts = relevant_records.group(:distortion_list_id).count.sort_by { |_, v| -v }.to_h

    # valueが最大のkeyを取得
    max_count = dist_id_counts.values.max
    max_id = dist_id_counts.key(max_count)

    # keyを持つレコードを取得
    record = DistortionList.find_by(id: max_id)

    return { distortion_name: record.distortion_name, max_count: max_count }
  end
end

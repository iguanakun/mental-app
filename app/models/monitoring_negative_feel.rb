class MonitoringNegativeFeel < ApplicationRecord
  belongs_to :monitoring
  belongs_to :negative_feel

  def self.negative_max_count(user_id)
    # 特定のユーザーに関連づけられたmonitoring_idの最大値を取得
    max_monitoring_ids = Monitoring.where(user_id: user_id).pluck(:id)

    # 特定のユーザーに関連づけられたmonitoring_idと一致するレコードをフィルタリング
    relevant_records = where(monitoring_id: max_monitoring_ids)

    # negative_feel_idごとの出現回数をカウントして、降順でソート
    negative_id_counts = relevant_records.group(:negative_feel_id).count.sort_by { |_, v| -v }.to_h

    # valueが最大のkeyを取得
    max_count = negative_id_counts.values.max
    max_id = negative_id_counts.key(max_count)

    # keyを持つレコードを取得
    record = NegativeFeel.find_by(id: max_id)

    return { negative_feel_name: record.negative_feel_name, max_count: max_count }
  end
end

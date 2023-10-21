class MonitoringForm
  include ActiveModel::Model
  attr_accessor(
    :fact, :mind, :feel, :body, :behavior, :user_id,
    :id, :created_at, :updated_at,
    :tag_name
  )

  validate :required_either_columns

  def save
    monitoring = Monitoring.create(fact: fact, mind: mind, feel: feel, body: body, behavior: behavior, user_id: user_id)
    if tag_name.present?
      input_tags = tag_name.split
      input_tags.each do |item|
        tag = Tag.where(tag_name: item).first_or_initialize
        if tag.id.nil?
          tag.user_id = user_id;
        end
        tag.save
        MonitoringTagRelation.create(monitoring_id: monitoring.id, tag_id: tag.id)
      end
    end
  end

  def update(params, monitoring)
    #一度タグの紐付けを消す
    monitoring.monitoring_tag_relations.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    input_tags = params.delete(:tag_name).split
    monitoring.update(params)
    if input_tags.present?
      input_tags.each do |item|
        #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
        tag = Tag.where(tag_name: item).first_or_initialize 
        tag.user_id = user_id if tag.id.nil?

        #タグを保存
        tag.save
        MonitoringTagRelation.create(monitoring_id: monitoring.id, tag_id: tag.id)
      end
    end
  end

  private

  def required_either_columns
    return if fact.present? || mind.present? || feel.present? || body.present? || behavior.present?
    errors.add(:base, 'Data is invalid')
  end
end
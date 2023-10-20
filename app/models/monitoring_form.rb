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
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      if tag.id.nil?
        tag.user_id = user_id;
      end
      tag.save
      MonitoringTagRelation.create(monitoring_id: monitoring.id, tag_id: tag.id)
    end
  end

  def update(params, monitoring)
    monitoring.update(params)
  end

  private

  def required_either_columns
    return if fact.present? || mind.present? || feel.present? || body.present? || behavior.present?
    errors.add(:base, 'Data is invalid')
  end
end
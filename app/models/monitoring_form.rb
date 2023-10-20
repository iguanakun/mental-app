class MonitoringForm
  include ActiveModel::Model
  attr_accessor(
    :fact, :mind, :feel, :body, :behavior, :user_id,
    :id, :created_at, :updated_at
  )

  validate :required_either_columns

  def save
    Monitoring.create(fact: fact, mind: mind, feel: feel, body: body, behavior: behavior, user_id: user_id)
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
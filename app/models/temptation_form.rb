class TemptationForm
  include ActiveModel::Model
  attr_accessor(
    :event, :talk, :cost, :get_out, :user_id,
  :id, :created_at, :updated_at
  )

  validate :required_either_columns

  def save
    Temptation.create(event: event, talk: talk, cost: cost, get_out: get_out, user_id: user_id)
  end

  def update(params, temptation)
    temptation.update(params)
  end

  private

  def required_either_columns
    return if event.present? || talk.present? || cost.present? || get_out.present?
    errors.add(:base, 'Data is invalid')
  end
end
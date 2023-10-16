class Temptation < ApplicationRecord
  validate :required_either_columns
  belongs_to :user
  encrypts :event, :talk, :cost, :get_out

  private

  def required_either_columns
    return if event.present? || talk.present? || cost.present? || get_out.present?
    errors.add(:base, 'Data is invalid')
  end
end

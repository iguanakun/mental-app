class TemptationForm
  include ActiveModel::Model
  attr_accessor(
    :event, :talk, :cost, :get_out, :user_id,
    :id, :created_at, :updated_at,
    :tag_name
  )

  validate :required_either_columns

  def save
    temptation = Temptation.create(event: event, talk: talk, cost: cost, get_out: get_out, user_id: user_id)
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
			tag.user_id = user_id;
      tag.save
      TemptationTagRelation.create(temptation_id: temptation.id, tag_id: tag.id)
    end
  end

  def update(params, temptation)
    #一度タグの紐付けを消す
    temptation.temptation_tag_relations.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

    #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.user_id = user_id if tag.id.nil?

    #タグを保存
    tag.save if tag_name.present?
    temptation.update(params)
    TemptationTagRelation.create(temptation_id: temptation.id, tag_id: tag.id) if tag_name.present?
  end

  private

  def required_either_columns
    return if event.present? || talk.present? || cost.present? || get_out.present?
    errors.add(:base, 'Data is invalid')
  end
end
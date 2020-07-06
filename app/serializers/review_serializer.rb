class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :visit_id, :content, :updated_at

  belongs_to :user
end

class VisitSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :start_date, :end_date, :park_id
end

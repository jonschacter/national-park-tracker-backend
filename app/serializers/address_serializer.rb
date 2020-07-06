class AddressSerializer < ActiveModel::Serializer
  attributes :id, :line1, :line2, :line3, :city, :state, :postal
end

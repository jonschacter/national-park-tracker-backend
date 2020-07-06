class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url, :caption, :alt
end

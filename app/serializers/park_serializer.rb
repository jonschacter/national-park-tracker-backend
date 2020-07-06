class ParkSerializer < ActiveModel::Serializer
    has_many :images
    has_many :addresses
  
    attributes :id, :name, :description, :states
end

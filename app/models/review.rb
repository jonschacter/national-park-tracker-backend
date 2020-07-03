class Review < ApplicationRecord
    belongs_to :visit
    has_one :user, through: :visit
    has_one :park, through: :visit
end

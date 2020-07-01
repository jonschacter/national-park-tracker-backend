class Visit < ApplicationRecord
    belongs_to :user

    validates :park_code, presence: true, allow_blank: false
end

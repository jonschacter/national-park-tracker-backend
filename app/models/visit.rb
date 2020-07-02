class Visit < ApplicationRecord
    belongs_to :user

    validates :park_id, presence: true, allow_blank: false
    validates :start_date, presence: true
    validates :end_date, presence: true
end

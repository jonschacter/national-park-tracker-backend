class Visit < ApplicationRecord
    belongs_to :user
    belongs_to :park
    has_one :review

    validates :park_id, presence: true, allow_blank: false
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates_format_of :start_date, :end_date, :with => /\A([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))\Z/, :message => "must be formatted YYYY-MM-DD"
end

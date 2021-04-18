class Review < ApplicationRecord
    belongs_to :visit
    has_one :user, through: :visit
    has_one :park, through: :visit
    
    validates :visit_id, presence: true
    validates :content, presence: true, allow_blank: false
end

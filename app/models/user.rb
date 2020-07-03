class User < ApplicationRecord
    has_many :visits
    has_many :reviews, through: :visits
    has_secure_password
    
    validates :username, presence: true
    validates :username, uniqueness: true
end

class Store < ApplicationRecord
    has_many :credits
    has_many :users, through: :credits
end

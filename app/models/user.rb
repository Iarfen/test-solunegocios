class User < ApplicationRecord
    has_many :credits
    has_many :stores, through: :credits
end

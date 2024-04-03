class Client < ApplicationRecord
    validates :full_name, presence: true
    validates :phone, presence: true
    validates :email, presence: true
end

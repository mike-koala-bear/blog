class Address < ApplicationRecord
  belongs_to :user, inverse_of: :address
  validates :street, :city, :state, :zip, :country, presence: true
end

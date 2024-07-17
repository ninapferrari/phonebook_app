class Contact < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :phone, presence: true, format: { with: /\A\+?\d{10,15}\z/, message: 'must be a valid phone number' }
end

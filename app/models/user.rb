class User < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates_presence_of :name, :email
  validates :email, uniqueness: true
  validates_presence_of :password, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password
end

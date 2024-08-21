class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: {minimum: 6 }
  validates_confirmation_of :password
  before_validation { email.downcase! }

end
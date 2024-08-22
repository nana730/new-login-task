class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  validates :email, presence: true, uniqueness: { message: "はすでに使用されています" }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: {minimum: 6 }
  validates :password_confirmation, presence: true, confirmation: true
  before_validation { email.downcase! }

end
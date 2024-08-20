class User < ApplicationRecord
  has_secure_password
  has_many :tasks
  validates :name, presence: { message: '名前を入力してください'}
  validates :email, presence: { message: 'メールアドレスを入力してください'}
  validates :email, uniqueness: {message: 'メールアドレスはすでに使用されています'}
  validates :password, presence: {message: 'メールアドレスを 入力してください'},
  length: {minimum: 6, message: 'パスワードは6文字以上で入力してください'}
  validates :password_confirmation, presence: true, confirmation: { message: 'パスワード（確認）とパスワードの入力が一致しません' }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }

end
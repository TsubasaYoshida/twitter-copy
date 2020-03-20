class User < ApplicationRecord
  devise :database_authenticatable,
         # deviseのバリデーションの仕組みがわからないので、自前で作る
         # :validatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :screen_name,
            presence: true,
            length: {maximum: 20},
            # MySQLの場合、大文字小文字を区別するかについて明示する必要がある(Rails6.1から)。
            uniqueness: {case_sensitive: false}
  validates :name,
            presence: true,
            length: {maximum: 30}
  validates :email,
            presence: true,
            length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password,
            presence: true,
            length: {minimum: 6},
            confirmation: true
end

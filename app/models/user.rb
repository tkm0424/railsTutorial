class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: true
  #存在性のバリデーションもしてくれるのが、新しくレコードが追加されたときだけに適用される
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end

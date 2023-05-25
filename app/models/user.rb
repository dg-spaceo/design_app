class User < ApplicationRecord
  has_secure_password

  enum role: [:admin]

  validates :email, presence: true

end

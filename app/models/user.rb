class User < ApplicationRecord
  has_many :repositories, inverse_of: :user, dependent: :destroy

  validates :username, presence: true
end

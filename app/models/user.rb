class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ } 
    validates :birthday

    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    
  end

  has_many :items
end

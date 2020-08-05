class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  KANA_NAME_REGEX = /\A[ァ-ンー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: false },
                      format: { with: EMAIL_REGEX },
                      confirmation: true
    validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
    validates :birthday

    with_options format: { with: NAME_REGEX } do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: KANA_NAME_REGEX } do
      validates :kana_family_name
      validates :kana_first_name
    end
  end

  has_many :items
  has_many :dealings
end

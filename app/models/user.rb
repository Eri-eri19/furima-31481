class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   with_options presence: true do
    validates :nickname
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    NAME_MESSAGE1 = '全角ひらがな、全角カタカナ、漢字のみで入力して下さい'.freeze
    validates :lastname, format: { with: NAME_REGEX, message: NAME_MESSAGE1 }
    validates :firstname, format: { with: NAME_REGEX, message: NAME_MESSAGE1 }
    NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    NAME_MESSAGE2 = '全角カタカナのみで入力して下さい'.freeze
    validates :lastnamekana, format: { with: NAME_KANA_REGEX, message: NAME_MESSAGE2 }
    validates :firstnamekana, format: { with: NAME_KANA_REGEX, message: NAME_MESSAGE2 }
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }, length: { minimum: 6 }

end



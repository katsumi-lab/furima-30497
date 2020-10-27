class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :date
  end
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[!-\/:-@\[-`{-~])[!-~]{6,100}+\z/i}

  with_options presence: true do
    with_options format: { with: /^[ぁ-んァ-ン一-龥]/, multiline: true } do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, multiline: true } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          
  validates :nickname, presence:true

  validates :password, confirmation: true

  with_options presence: true do
    with_options format: {with: /^[ぁ-んァ-ン一-龥]/,multiline: true} do
      validates :family_name
      validates :first_name
    end

    with_options format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,multiline: true} do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
end
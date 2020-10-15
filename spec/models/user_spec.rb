require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.family_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.family_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "dateが空では登録できない" do
      user = FactoryBot.build(:user)
      user.date = ""
      user.valid?
      expect(user.errors.full_messages).to include("Date can't be blank")
    end
  end
end

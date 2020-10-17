require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以下であれば登録できない" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 7 characters)")
    end
    it "passwordが半角英数字混合でなければ登録できない" do
      @user.password = "[ -~]"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "family_nameが空だと登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_nameが全角でなければ登録できない" do
      @user.family_name = "/\A[ぁ-んァ-ン一-龥]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameが全角でなければ登録できない" do
      @user.first_name = "/\A[ぁ-んァ-ン一-龥]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "family_name_kanaが全角カナでなければ登録できない" do
      @user.family_name_kana = "/\A[ァ-ン]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "first_name_kanaが全角カナでなければ登録できない" do
      @user.first_name_kana = "/\A[ァ-ン]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "dateが空では登録できない" do
      @user.date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Date can't be blank")
    end

    it "必要な情報を全て入力しないと登録できない" do
      @user.nickname = "abe"
      @user.email = "kkk@gmail.com"
      @user.password = "0000000"
      @user.password_confirmation = "0000000"
      @user.family_name = "山田"
      @user.first_name = "太郎"
      @user.family_name_kana = "ヤマダ"
      @user.first_name_kana = "タロウ"
      @user.date = "1930-01-01"
      expect(@user).to be_valid
    end
  end
end

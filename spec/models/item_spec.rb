require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.png")
  end

  describe '商品登録ができる'
    it "商品画像が空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空と登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品カテゴリーが空と登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態が空と登録できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "配送料の負担が空と登録できない" do
      @item.shipping_cost_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end

    it "発送元の地域が空と登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "発送までの日数が空と登録できない" do
      @item.shipping_timing_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping timing can't be blank")
    end

    it "価格が空と登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格の範囲が¥300〜¥9,999,999の間でないと登録できない" do
      @item.price = "300 - 9999999"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "価格は半角数字でないと登録できない" do
      @item.price = "0000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "全ての項目が入力されていないと登録できない" do
      @item.name = "name"
      @item.price = "0000000"
      @item.description = Faker::Lorem.paragraph
      @item.user_id = "0"
      @item.category_id = "0"
      @item.status_id = "0"
      @item.shipping_cost_id = "0"
      @item.shipping_timing_id = "0"
      @item.prefecture_id = "0"
    end
end
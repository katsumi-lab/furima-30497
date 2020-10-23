require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  describe '商品購入ができる'
  it '郵便番号が空だと登録できない' do
    @order_delivery.postal_code = ''
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
  end
  it '郵便番号はハイフンがないと登録できない' do
    @order_delivery.postal_code = "1234567"
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Postal code is invalid")
  end

  it '都道府県が空だと登録できない' do
    @order_delivery.prefecture_id = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
  end

  it '市区町村が空だと登録できない' do
    @order_delivery.municipality = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Municipality can't be blank")
  end

  it '番地が空だと登録できない' do
    @order_delivery.address_number = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Address number can't be blank")
  end

  it '電話番号が空だと登録できない' do
    @order_delivery.phone_number = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
  end
  it '電話番号がハイフンなしの11桁だと登録できる' do
    @order_delivery.phone_number = '09012345678'
    @order_delivery.valid?
    expect(@order_delivery).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @order_delivery.token = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
  end
end

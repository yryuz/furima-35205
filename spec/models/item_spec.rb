require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    end



  describe '商品出品' do
    context '商品出品ができるとき' do
     it "全ての項目の入力が存在すれば登録できること" do
      expect(@item).to be_valid
  end
  end
  end

    context '商品出品が出来ないとき' do

      it "出品画像が存在しないとき出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

    it "商品名が存在しないとき出品できない" do
    @item.name = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it "商品の説明がないとき出品できない" do
    @item.introduction = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Introduction can't be blank")
  end

  it "価格が存在がないとき出品できない" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it "価格が300円未満の場合出品できない" do
    @item.price = 100
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than 300")
  end

  it "価格が9999999円より高い場合出品できない" do
    @item.price = 1000000000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than 9999999")
  end

  

  it "カテゴリーの情報がない場合出品できない" do
    @item.category_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
  end

  it "商品の状態の情報がない場合出品できない" do
    @item.condition_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
  end

  it "配送料の負担についての情報がない場合出品できない" do
    @item.postage_payer_id = ""
    @item.valid? 
    expect(@item.errors.full_messages).to include("Postage payer can't be blank", "Postage payer is not a number")
  end

  it "発送元の地域の情報がない場合出品できない" do
    @item.prefecture_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
  end
    
 it "発送までの日数の情報がない場合出品できない" do
  @item.preparation_day_id = ""
  @item.valid?
  expect(@item.errors.full_messages).to include("Preparation day can't be blank", "Preparation day is not a number")
  end

end


end


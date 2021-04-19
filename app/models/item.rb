class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :postage_payer_id
    validates :prefecture_id
    validates :preparation_day_id
    validates :category_id
    validates :condition_id
    validates :image

  end

  with_options numericality: { other_than: 1 } do
    validates :postage_payer_id
    validates :prefecture_id
    validates :preparation_day_id
    validates :category_id
    validates :condition_id

  end

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { only_integer: true,greater_than: 299, less_than: 10000000 }


  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :prefecture
  belongs_to :preparation_day
end

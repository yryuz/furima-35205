class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname 
    validates :password_confirmation
    validates :first_name
    validates :first_name_kana
    validates :family_name
    validates :family_name_kana
    validates :birth_day

  end

  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :password_confirmation, presence: true  
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/  }
  validates_format_of :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates_format_of :family_name_kana, with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  validates_format_of :first_name_kana, with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end

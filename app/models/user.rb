class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :password_confirmation, presence: true  
  validates :family_name, presence: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/  }
  validates :first_name, presence: true
  validates_format_of :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :family_name_kana, presence: true
  validates_format_of :family_name_kana, with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  validates :first_name_kana, presence: true
  validates_format_of :first_name_kana, with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  validates :birth_day, presence: true

end

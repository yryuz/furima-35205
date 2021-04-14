class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :password_confirmation, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day
  end

  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :password_confirmation, presence: true  
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/  }
  validates_format_of :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates_format_of :family_name_kana, with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  validates_format_of :first_name_kana, with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  

end

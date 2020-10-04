class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  full_width_char = '\A[ぁ-んァ-ン一-龥]+\z'
  kana_char = '\A[ァ-ン]+\z'

  ## ユーザー情報
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true,
                      format: { with: /@.+/ }
    validates :password, length: { minimum: 6 },
                         format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :password_confirmation

    ## 本人情報確認
    validates :first_name, format: { with: /#{full_width_char}/ }
    validates :last_name, format: { with: /#{full_width_char}/ }
    validates :first_name_kana, format: { with: /#{kana_char}/ }
    validates :last_name_kana, format: { with: /#{kana_char}/ }
    validates :birthday
  end
end

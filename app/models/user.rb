class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  ## ユーザー情報
  validates :nickname, presence: true
  validates :email, presence: true, 
                    uniqueness: true, 
                    format: { with: /@.+/ }
  validates :password, presence: true, length: { minimum: 6 },
                       format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :password_confirmation, presence: true

  ## 本人情報確認
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ン]+\z/ }
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true

end

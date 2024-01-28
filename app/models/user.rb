class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  # NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/.freeze

  # validates :password, format: { with: PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true

  # validates :first_name, presence: true, format: { with: NAME_REGEX}
  # validates :last_name, presence: true, format: { with: NAME_REGEX}
  # validates :first_name_kana, presence: true, format: { with: NAME_KANA_REGEX}
  # validates :last_name_kana, presence: true, format: { with: NAME_KANA_REGEX}
  validates :birth_date, presence: true
end

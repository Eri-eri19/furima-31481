class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_charge
  belongs_to :category
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :item_status

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 } do
    validates :delivery_charge_id
    validates :category_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :item_status_id
  end

  # ActiveStrage画像ファイルアソシエーション
  has_one_attached :image
  belongs_to :user
  has_one :record

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  PRICE_MESSAGE = '半角数字のみで入力して下さい'.freeze
  validates :price, format: { with: PRICE_REGEX, message: PRICE_MESSAGE },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end

class Item < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true
  validates :description, presence: true
  validates :item_status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_area_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

   #空の投稿を保存できないようにする
   validates :title, :text, presence: true

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :genre_id, numericality: { other_than: 1 } 
   # ActiveStrage画像ファイルアソシエーション
   has_one_attached :image

end


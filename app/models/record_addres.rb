class RecordAddres
  include ActiveModel::Model
  attr_accessor :postal_code, :municipality, :street_number, :phonenumber, :delivery_area_id, :building_name, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンをつけて入力してください' }
    validates :municipality
    validates :street_number
    validates :phonenumber, format: { with: /\A\d{10,11}\z/, message: 'はハイフンなし、 かつ１２桁以上では登録できません' }
    validates :phonenumber, format: { with: /\A[0-9]+\z/i, message: '半角数字以外では登録できません' }
    validates :delivery_area_id , numericality: { other_than: 1 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create( record_id: record.id ,postal_code: postal_code, delivery_area_id: delivery_area_id, municipality: municipality, street_number: street_number,
                    phonenumber: phonenumber, building_name: building_name)
  end
end
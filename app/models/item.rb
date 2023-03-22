class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # テーブルとのアソシエーション
  belongs_to :user
  has_one :order

  # active_storageとのアソシエーション
  has_one_attached :image

  # activehashとのアソシエーション
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_date_id
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :item_status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_date_id
  end
end

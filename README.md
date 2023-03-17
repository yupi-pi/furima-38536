# テーブル設計

## usersテーブル

|Column              |Type   |Options                  |
|--------------------|-------|-------------------------|
|nickname            |string |null: false              |
|email               |string |null: false, unique: true|
|encrypted_password  |string |null: false              |
|last_name           |string |null: false              |
|first_name          |string |null: false              |
|last_name_kana      |string |null: false              |
|first_name_kana     |string |null: false              |
|birthday            |date   |null: false              |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|name              |string     |null: false                   |
|description       |text       |null: false                   |
|category_id       |integer    |null: false                   |
|item_status_id    |integer    |null: false                   |
|delivery_cost_id  |integer    |null: false                   |
|prefecture_id     |integer    |null: false                   |
|delivery_date_id  |integer    |null: false                   |
|price             |integer    |null: false                   |
|user              |references |null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

- has_one_attached :image

- belongs_to :category
- belongs_to :item_status
- belongs_to :delivery_cost
- belongs_to :prefecture
- belongs_to :delivery_date

## ordersテーブル

|Column|Type       |Options                       |
|------|-----------|------------------------------|
|user  |references |null: false, foreign_key: true|
|item  |references |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :payment

## paymentsテーブル

|Column         |Type       |Options                       |
|---------------|-----------|------------------------------|
|postcode       |string     |null: false                   |
|prefecture_id  |integer    |null: false                   |
|city           |string     |null: false                   |
|block          |string     |null: false                   |
|building       |string     |                              |
|phone_number   |string     |null: false                   |
|order          |references |null: false, foreign_key: true|

### Association
- belongs_to :order
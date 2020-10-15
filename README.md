## usersテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| date             | date    | null: false |

### Association
- has_many :products
- has_many :orders


## productsテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| status          | integer | null: false                    |
| shipping_cost   | integer | null: false                    |
| shipping_timing | integer | null: false                    |
| shipping_source | string  | null: false                    |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| product_id      | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :delivery


## deliveriesテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| postal_code     | string  | null: false |
| prefecture      | integer |             |
| municipality    | integer |             |
| address_number  | integer |             |
| building_name   | integer |             |
| phone_number    | string  | null: false |


### Association
- belongs_to :order
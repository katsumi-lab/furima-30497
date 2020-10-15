## usersテーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| email     | string  | null: false, foreign_key: true |
| password  | string  | null: false, foreign_key: true |
| name      | string  | null: false, foreign_key: true |

### Association
- has_many :products
- has_many :orders


## productsテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| name            | string  | null: false, foreign_key: true |
| price           | integer | null: false, foreign_key: true |
| description     | text    | null: false, foreign_key: true |
| user_id        | integer | null: false, foreign_key: true |
| image           | text    | null: false, foreign_key: true |
| status          | string  | null: false, foreign_key: true |
| shipping_cost   | string  | null: false, foreign_key: true |
| shipping_timing | string  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| product_id      | integer | null: false, foreign_key: true |
| card_number     | integer | null: false, foreign_key: true |
| good_thru       | integer | null: false, foreign_key: true |
| security_code   | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :delivery


## deliveriesテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| postal_code     | integer | null: false, foreign_key: true |
| prefecture      | string  | null: false, foreign_key: true |
| municipality    | string  | null: false, foreign_key: true |
| address_number  | integer | null: false, foreign_key: true |
| building_name   | string  | null: false, foreign_key: true |
| phone_number    | integer | null: false, foreign_key: true |
| user_id         | integer | null: false, foreign_key: true |
| order_id        | integer | null: false, foreign_key: true |

### Association
- belongs_to :order
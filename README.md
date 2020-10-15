## usersテーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| email     | string  | null: false, foreign_key: true |
| password  | string  | null: false, foreign_key: true |
| name      | string  | null: false, foreign_key: true |

### Association
- has_many :products


## productsテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| name            | string  | null: false, foreign_key: true |
| price           | integer | null: false, foreign_key: true |
| description     | text    | null: false, foreign_key: true |
| users_id        | integer | null: false, foreign_key: true |
| image           | text    | null: false, foreign_key: true |
| status          | string  | null: false, foreign_key: true |
| shipping_cost   | string  | null: false, foreign_key: true |
| shipping_timing | string  | null: false, foreign_key: true |
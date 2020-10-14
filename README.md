## usersテーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| email     | string  | null: false, foreign_key: true |
| password  | string  | null: false, foreign_key: true |
| name      | string  | null: false, foreign_key: true |


### Association
- has_many :products
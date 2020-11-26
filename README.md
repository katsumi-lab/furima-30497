# README

## アプリケーション名 ： 
furima

## アプリケーション概要 : 
有名フリマアプリのクローンサイト。スクール最終課題。

## URL : 
https://furima-30497.herokuapp.com/#

## テスト用アカウント : 
お名前　　　：山田　太郎
お名前カナ　：ヤマダ　タロウ
ニックネーム：sample2
誕生日：1930/01/01
Eメール　：sample2@gmail.com
パスワード　：sample2

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


## itemsテーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| price              | integer | null: false                    |
| description        | text    | null: false                    |
| user_id            | integer | null: false, foreign_key: true |
| category_id        | integer | null: false                    |
| status_id          | integer | null: false                    |
| shipping_cost_id   | integer | null: false                    |
| shipping_timing_id | integer | null: false                    |
| prefecture_id      | integer | null: false                    |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :item


## deliveriesテーブル

| Column          | Type    | Options                        | 
| --------------- | ------- | ------------------------------ |
| postal_code     | string  | null: false                    | 
| prefecture_id   | integer | null: false                    | 
| municipality    | string  | null: false                    | 
| address_number  | string  | null: false                    | 
| building_name   | string  |                                | 
| phone_number    | string  | null: false                    | 
| order_id        | integer | null: false, foreign_key: true |

### Association
- belongs_to :order
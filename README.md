# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_kana          | string | null: false               |
| birthday           | string | null: false               |

### Association

  has_many :items
  has_many :buyers
  has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| goods         | string     | null: false                    |
| product       | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_cost | string     | null: false                    |
| place         | string     | null: false                    |
| days_to_ship  | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

  has_one :buyers
  has_one :purchases
  belongs_to :users

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

  has_one :items
  has_one :purchases
  belongs_to :users

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| purchase_status | boolean    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

  has_one :items
  has_one :buyers
  belongs_to :users
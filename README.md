# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| comment            | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| day_to_ship_id     | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
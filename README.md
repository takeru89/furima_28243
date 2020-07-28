# テーブル設計

## users テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| kana_family_name | string     | null: false                    |
| kana_first_name  | string     | null: false                    |
| birth_year_id    | references | null: false, foreign_key: true |
| birth_month_id   | references | null: false, foreign_key: true |
| birth_date_id    | references | null: false, foreign_key: true |

### Association
- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user_id           | references | null: false, foreign_key: true |
| item_name         | string     | null: false                    |
| introduction      | string     | null: false                    |
| category_id       | references | null: false, foreign_key: true |
| condition_id      | references | null: false, foreign_key: true |
| shipping_payer_id | references | null: false, foreign_key: true |
| shipping_from_id  | references | null: false, foreign_key: true |
| shipping_dates_id | references | null: false, foreign_key: true |
| price             | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :image
- belongs_to :order
- has_many   :comments

## images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| image   | text       | null: false                    |

### Association

- belongs_to :item

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |
| credit_card_id | references | null: false, foreign_key: true |
| address_id     | references | null: false, foreign_key: true |
| item_price     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address
- belongs_to :credit_card

## credit_cards テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| card_num         | integer | null: false |
| expiration_month | integer | null: false |
| expiration_year  | integer | null: false |
| security_num     | integer | null: false |

### Association

- belongs_to :order

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| block_num     | integer    | null: false                    |
| building      | string     |                                |
| phone_num     | integer    | null :false                    |

### Association

- belongs_to :order

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |

### Association
- belongs_to :users
- belongs_to :items
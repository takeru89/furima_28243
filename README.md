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
| birthday         | date       | null: false,foreign_key :true  |

### Association
- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| name              | string     | null: false                    |
| introduction      | text       | null: false                    |
| category          | references | null: false, foreign_key: true |
| condition         | references | null: false, foreign_key: true |
| shipping_payer    | references | null: false, foreign_key: true |
| shipping_from     | references | null: false, foreign_key: true |
| shipping_dates    | references | null: false, foreign_key: true |
| price             | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :order
- belongs_to :address
- has_many   :items
- has_many   :comments

## images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| image   | text       | null: false                    |

### Association

- belongs_to :item

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| block_num     | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null :false                    |

### Association

- belongs_to :item

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
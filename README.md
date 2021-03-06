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
| birthday         | date       | null: false                    |

### Association
- has_many :items
- has_many :comments
- has_many :dealings

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| name              | string     | null: false                    |
| introduction      | text       | null: false                    |
| category          | integer    | null: false                    |
| condition         | integer    | null: false                    |
| shipping_payer    | integer    | null: false                    |
| shipping_from     | integer    | null: false                    |
| shipping_dates    | integer    | null: false                    |
| price             | integer    | null: false                    |

### Association
- belongs_to :user
- has_one    :address
- has_one    :dealing
- has_many   :images
- has_many   :comments

## images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| image   | text       | null: false                    |

### Association

- belongs_to :item

## dealings テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block_num     | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null :false                    |

### Association

- belongs_to :dealing

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
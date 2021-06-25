# テーブル設計


## usersテーブル

| Column                | Type   | Options     |
| ----------------------| ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| confirmation_password | string | null: false |
| name                  | string | null: false |
| name_kana             | string | null: false |
| charges               | string | null: false |
| area                  | string | null: false |
| days_to_ship          | string | null: false |

### Association

- has_many :items
- has_many :buyers

## itemsテーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| item_name   | string     | null: false                    |
| buyer_id    | references | null: false, foreign_key: true |
| seller_id   | references | null: false, foreign_key: true |
| category    | string     | null: false                    |
| price       | string     | null: false                    |
| description | text       | null: false                    |
| condition   | text       | null: false                    |
| nickname    | string     | null: false                    |

### Association
- has_one :buyers
- belongs_to :users

## buyers テーブル

| Column                | Type   | Options     |
| ----------------------| ------ | ----------- |
| nickname              | string | null: false |
| item_name             | string | null: false |


### Association
 - belongs_to :users
 - be_longs_to :items
 - has_many :shippings

## shippings テーブル

| Column                | Type   | Options     |
| ----------------------| ------ | ----------- |
| phone_number          | string | null: false |
| ship_region           | string | null: false |
| ship_city             | string | null: false |
| ship_address          | string | null: false |
| postal_code           | string | null: false |





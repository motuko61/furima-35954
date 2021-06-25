# テーブル設計


## usersテーブル

| Column                | Type   | Options                   |
| ----------------------| ------ | --------------------------|
| nickname              | string | null: false               |
| email                 | string | null: false, unique :true | 
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| date_of_birth         | date   | null: false               |
### Association

- has_many :items
- has_many :buyers

## itemsテーブル

| Column          | Type       | Options                        |
| ----------------| -----------| -------------------------------|
| item_name       | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| category_id     | integer    | null: false                    |
| price           | integer    | null: false                    |
| description     | text       | null: false                    |
| condition_id    | integer    | null: false                    |
| charge_id       | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| days_to_ship_id | integer    | null: false                    |

### Association
- has_one :buyer
- belongs_to :user

## buyers テーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item
 - has_one :shipping

## shippings テーブル

| Column                | Type       | Options                        |
| ----------------------| -----------| ------------------------------ |
| phone_number          | string     | null: false                    |
| area_id               | integer    | null: false                    |
| ship_city             | string     | null: false                    |
| ship_address          | string     | null: false                    |
| ship_to_address       | string     |                                |
| postal_code           | string     | null: false                    |
| user                  | references | null: false, foreign_key: buyer|


### Association
- belongs_to :buyer





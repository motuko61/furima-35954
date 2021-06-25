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
| date_of_birth         | string | null: false               |
### Association

- has_many :items
- has_many :buyers

## itemsテーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| item_name   | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| category    | string     | null: false                    |
| price       | string     | null: false                    |
| description | text       | null: false                    |
| condition   | text       | null: false                    |


### Association
- has_one :buyer
- belongs_to :user

## buyers テーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| nickname    | string     | null: false                    |
| item_name   | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - be_longs_to :item
 - has_one :shipping

## shippings テーブル

| Column                | Type   | Options     |
| ----------------------| ------ | ----------- |
| phone_number          | string | null: false |
| ship_region           | string | null: false |
| ship_city             | string | null: false |
| ship_address          | string | null: false |
| ship_to_address       | string | null: false |
| postal_code           | string | null: false |


### Association
- has_one :buyer





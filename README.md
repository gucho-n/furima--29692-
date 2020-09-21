## users テーブル 9.21 21:20


| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| surname       | string | null: false |
| firstname     | string | null: false |
| surname_kana  | string | null: false |
| firstname_kana| string | null: false |
| email         | string | null: false |
| nickname      | string | null: false |
| password      | string | null: false |
| birthday      | date   | null: false |



### Association

- has_many :item_purchases
- has_many :items 

## items テーブル

| Column        | Type   | Options                      |
| --------------| ------ | -----------------------------|
| name          | string |                              | 
| origin_id     | integer| null: false foreign_key: true|
| category_id   | integer| null: false foreign_key: true|
| detail        | text   |                              |
| condition_id  | integer| null: false foreign_key: true|
| estimate_of_deliver_id| integer | null: false foreign_key: true|
| description   | text   |                              |
| price         | integer|                              |
| user_id       | integer| null: false foreign_key: true|
| address_id    | integer| null: false foreign_key: true|

イメージはactive_storage

### Association
- belongs_to :item_purchase
- has_many :users 

## item_purchases テーブル
| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| user        | reference | null: false,foreign_key: true |
| item        | reference | null: false,foreign_key: true |

- belongs_to  :user
- belongs_to  :item
  has_one :address

## address テーブル

| Column          | Type       |Options                        
| -------         | ---------- |-------------|
| postcode        | integer    | null: false |
| phonenumber     | integer    | null: false |
| city            | string    | null: false  |
| block           | integer    | null: false |
| building        | string     | null: true  |
| prefecture_id   | integer     | null: true  | null: false,foreign_key: true|

### Association

  belongs_to :item_purchase




 

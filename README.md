## users テーブル 9.21 21:20


| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| surname       | string | null: false |
| firstname     | string | null: false |
| surname_kana  | string | null: false |
| firstname_kana| string | null: false |
| name          | string | null: false |
| email         | string | null: false |
| nickname      | string | null: false |
| password      | string | null: false |


### Association

- has_many :item_purchases
- has_many :items though item_purchases

## items テーブル

| Column        | Type   | Options                      |
| --------------| ------ | -----------------------------|
| name          | string |                              | 
| origin        | integer|                              |
| category      | integer|                              |
| detail        | text   |                              |
| condition     | integer|                              |
| estimate_of_deliver | integer |                              |
| description   | text   |                              |
| price         | integer|                              |
| user_id       | integer| null: false foreign_key: true|
| address_id    | integer| null: false foreign_key: true|

イメージはactive_storage

### Association
- belongs_to :item_purchase
- has_many :users though :item_purchases

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
| shipping_charge | integer    | null: false |          
| shipping_date   | date       | null: false |
| shipping_way    | string     | null: false |
| postcode        | integer    | null: false |
| phonenumber     | integer    | null: false |
| city            | string    | null: false |
| block           | integer    | null: false |
| building        | string     | null: false |

### Association

  has_one :item_purchase




 

## users テーブル 9.22 11:20


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

- has_many :items
- has_many :item_purchases 

## items テーブル

| Column        | Type   | Options                      |
| --------------| ------ | -----------------------------|
|shipping_charge_id|integer |null:false
| name          | string |null:false                    | 
| address_id     | integer|null:false                    |
| category_id   | integer|null:false                    |
| condition_id  | integer|null:false                    |
| estimate_of_deliver_id|integer|null:false             |
| description   | text   |null:false                    |
| price         | integer|null:false                    |
| user          | references| null: false foreign_key: true|


belongs_to_active_hash :shipping_charge
belongs_to_active_hash :origin
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :estimate_of_deliver

### Association
  belongs_to :user
- has_one :item_purchase
- 

## item_purchases テーブル
| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| user        | references | null: false,foreign_key: true |
| item        | references | null: false,foreign_key: true |

- belongs_to  :user
- belongs_to  :item
  has_one :address

## addresses テーブル

| Column          | Type       |Options                        
| -------         | ---------- |------------|
| postcode        | string    | null: false |
| phonenumber     | string    | null: false |
| city            | string    | null: false |
| block           | string    | null: false|
| building        | string     | null: true |
| prefecture_id   | integer     |null:false |
| item_purchase | references | null: false, foreign_key: true|

### Association

  belongs_to :item_purchase
  belongs_to_active_hash :prefecture



 

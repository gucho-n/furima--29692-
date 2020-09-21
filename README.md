## users テーブル 9.21 20:00


| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| name          | string | null: false |
| phonenumber   | integer| null: false |
| email         | string | null: false |
| nickname      | integer| null: false |
| password      | string | null: false |

### Association

- has_many :item_purchases
- has_many :items though item_purchases

## items テーブル

| Column        | Type   | Options                      |
| --------------| ------ | -----------------------------|
| name          | string | null: false,foreign_key: true| 
| origin        | string | null: false foreign_key: true|
| category      | string | null: false foreign_key: true|
| detail        | text   | null: false foreign_key: true|
| condition     | string | null: false foreign_key: true|
| estimate_of_deliver | Date | null: false null: false foreign_key: true|
| image         | string | null: false foreign_key: true|
| description   | string | null: false foreign_key: true|
| price         | integer| null: false foreign_key: true|
| user_id       | integer| null: false foreign_key: true|
| address_id    | integer| null: false foreign_key: true|


### Association
- belongs_to :item_purchases
- has_many :users though :item_purchases

## item_purchases テーブル
| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| user        | reference | null: false,foreign_key: true |
| item        | reference | null: false,foreign_key: true |

- belongs_to  :users
- belongs_to  :items
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

  has_one :item_purchases




 

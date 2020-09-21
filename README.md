## users テーブル 9.21 20:00


| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| name          | string | null: false |
| phonenumber   | integer| null: false |
| email         | string | null: false |
| nickname      | integer| null: false |
| password      | string | null: false |

### Association

- has_many :users_items
- has_many :items though users_items

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
- belongs_to :items 
- has_many :users though :users_items

## users_items テーブル
| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| user        | reference | null: false,foreign_key: true |
| item        | reference | null: false,foreign_key: true |

- belongs_to  :users
- belongs_to  :items

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

  has_many :items


 

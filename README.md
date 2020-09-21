## users テーブル


| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| name          | string | null: false |
| phonenumber   | integer| null: false |
| emailaddress  | string | null: false |
| postcode      | integer| null: false |
| address       | string | null: false |

### Association

- has_many :order
- has_many :user_id
- has_many :items though items

#ユーザー本体の個人情報で、ログインに必要な情報と初期情報を記入
#ユーザーは複数のオーダーを頼める
#ユーザーがいくつも製品を出品できる（出品した製品と購入した製品をどう生合成つけるか悩みました）

## items テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| name          | string | null: false |
| origin        | string | null: false |
| category      | string | null: false |
| detail        | string | null: false |
| condition     | string | null: false |
| estimate_of_deliver | Date | null: false |
| image         | string | null: false |
| description   | string | null: false |
| order_id       | string | null: false |

### Association
#itemsとの関係は多対多か１対多か迷いましたが、たくさんのユーザーが同製品に興味を持つことを考え多多にしました
- has_many :orders
- has_many :users_items 
- has_many :users though :users_items

## users_items テーブル
#中間テーブルとして扱っております
| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| users_id    | reference | null: false,foreign_key: true |
| items_id    | reference | null: false,foreign_key: true |

- has_many  :users, through: user_items
- has_many  :users_items
- has_one   :price
  belongs_to:order


## order テーブル

| Column     | Type       |Options                        
| -------    | ---------- |-------------|
| order_date | date       | null: false |          
| order_item | string     | null: false |
| user_id    | integer    | null: false |
| deliver_id | integer    | null: false |

### Association

- belongs_to :user
- belongs_to :deliver
  has_many :items


  ## deliver テーブル

| Column        | Type     |option                       
| -------       | ---------|-------------|      
| shipping_charge | integer| null: false |             
| shipping_date   | date   | null: false |
| deliver_way     | string | null: false |
| delivery_address| string | null: false |

 has_many :order
＃オーダーを確定した後に配送情報を記入するので、別テーブル
 ## message テーブル  
| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| text          | string | null: false |
| image         | string | null: false |
| created_at    | date   | null: false |
| updated_at    | date   | null: false |
| detail        | string | null: false |
| condition     | string | null: false |
| image         | string | null: false |
| estimate_of_deliver    | date | null: false |
| items_id       | integer | null: false |

belongs_to :items

#itemsにするか、Userにするか、アソシエーションを悩みました

 ## price テーブル

| Column        | Type     |option                       
| -------       | ---------|-------------|      
| price         | integer  | null: false |              
| commission    | string   | null: false |
| benefit       | string   | null: false |
| items_id      | integer  | null: false |

 has_one :items

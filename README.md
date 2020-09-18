
## users テーブル

| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| name        | string | null: false |
| phonenumber | string | null: false |
| emailadress | string | null: false |
| postcode    | string | null: false |
| address     | string | null: false |


### Association
#親テーブルとして扱うので外部キーは指揮ません
#itemsとの関係は多対多か１対多か迷いましたが、たくさんのユーザーが同製品に興味を持つことを考え多多にしました
- has_many :orders
- has_many :users_items 
- has_many :items though :users_items

## users_items テーブル
#中間テーブルとして扱っております
| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| users_id    | reference | null: false,foreign_key: true |
| items_id    | reference | null: false,foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## orders テーブル
＃userと１体多の関係なので外部キーも差し込んでおります
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| costomer_code | string     | null: false, foreign_key: true |
| order_date    | date       | null: false, foreign_key: true |
| shipping_date | date       | null: false, foreign_key: true |
| deliver_way   | string     | null: false, foreign_key: true |
| delivery_address| string   | null: false, foreign_key: true |
| payment       | string     | null: false, foreign_key: true |

### Association

- belongs_to :user

# messages テーブル
＃itemsと１体多の関係なので外部キーも差し込んでおります
＃imageはimage型でしょうか
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false, foreign_key: true |
| image  | image      | null: false, foreign_key: true |
| created_at | date   | null: false, foreign_key: true |
| updated_at | date   | null: false, foreign_key: true |
| detail     | string | null: false, foreign_key: true |
| condition  | string | null: false, foreign_key: true |
| estimate_of_deliver | string| null: false, foreign_key
### Association

- belongs_to :items

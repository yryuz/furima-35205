## usersテーブル

Column | Type | Options
-|-|-
nickname | string | NOT NULL
email | string | NOT NULL, unique: true
encrypted_password | string | NOT NULL
first_name | string | NOT NULL
family_name | string | NOT NULL
first_name_kana | string | NOT NULL
family_name_kana | string | NOT NULL
birth_day | date | NOT NULL

### Association

- has_one :destination, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :purchases, dependent: :destroy



## destinationsテーブル

Column | Type | Options
-|-|-
user | references | null: false, foreign_key: true
post_code | integer | NOT NULL
prefecture | integer | NOT NULL
city | string | NOT NULL
house_number | string | NOT NULL
building_name | string |
phone_number | integer | NOT NULL

### Association

- belongs_to :user

## itemsテーブル

Column | Type | Options
-|-|-
name | string | NOT NULL
introduction | text | NOT NULL
price | integer | NOT NULL
user | references | null: false, foreign_key: true
postage_payer | integer | NOT NULL
prefecture_code | integer | NOT NULL
preparation_day | integer | NOT NULL
category_id | integer |  NOT NULL
condition | integer | NOT NULL

### Association

- belongs_to :user
- has_one :purchase



## purchasesテーブル

Column | Type | Options
-|-|-
user | references | null: false, foreign_key: true
item | references | null: false, foreign_key: true

### Association

- belongs_to :item
- belongs_to :user








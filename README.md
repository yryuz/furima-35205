## usersテーブル

Column | Type | Options
-|-|-
nickname | string | NOT NULL
email | string | NOT NULL
password | string | NOT NULL

### Association

- has_one :profiel, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :destination, dependent: :destroy
- has_many :items, dependent: :destroy
- has_one :buyer, dependent: :destroy

## profielsテーブル

Column | Type | Options
-|-|-
first_name | string | NOT NULL
family_name | string | NOT NULL
first_name_kana | string | NOT NULL
family_name_kana | string | NOT NULL
birth_day | date | NOT NULL
user | references | null: false, foreign_key: true

### Association

- belongs_to :user

## credit_cardsテーブル

Column | Type | Options
-|-|-
user_id | integer | NOT NULL
customer_id | string | NOT NULL
card_id | string | NOT NULL

### Association

- belongs_to :user

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
image | |
name | string | NOT NULL
introduction | text | NOT NULL
price | integer | NOT NULL
seller | references | null: false, foreign_key: true
postage_payer | integer | NOT NULL
prefecture_code | integer | NOT NULL
preparation_day | integer | NOT NULL
category | references |  null: false, foreign_key: true
condition | integer | NOT NULL

### Association

- belongs_to :user
- belongs_to :category
- has_one :buyer

## categoriesテーブル

Column | Type | Options
-|-|-
name | integer | NOT NULL

### Association

- has_many :items

## buyersテーブル

Column | Type | Options
-|-|-
user | references | null: false, foreign_key: true

### Association

- belongs_to :item
- belongs_to :user








## README

# :diamond_shape_with_a_dot_inside: 「フリーマーケットアプリ」  
  
# :star2: アプリケーション概要
  ### 気軽にオンラインで出品と購入がしたい方のためのアプリです。  
  フリマアプリ【メルカリ】のクローンサイト。 誰でも簡単に売買が楽しめるフリマアプリ機能を再現しています。 ユーザー登録、出品、購入機能を再現しています。
  
  # :speech_balloon: 使用言語・技術
  - Ruby
  - Ruby on Rails
  - JavaScript
  - HTML/CSS
  - SQL
  - AWS
  
# :whale2: URL
  [アプリURL]https://furima-28192.herokuapp.com/
  


# :book: 利用方法
  * Basic認証
    * ID:syake
    * Pass:shiromi

  * テスト用アカウント
    * 出品者用(email:sample@sample.com, password:mino89)
    * 購入者用(email:sample2@sample.com, password:mino90)  

  * テスト用カード
    * カード番号：4242424242424242
    * CVC：123  
    * 期限日：11/24

  **1. 品物の出品まで**  
    - アクセスするとトップページに遷移  
    - ログインページに遷移した上で、上記テスト用アカウントでログイン  
    - ページ右下の「:camera:カメラマーク」をクリック  
    ![出品画面へ](https://user-images.githubusercontent.com/69069717/104935319-6a926680-59ee-11eb-9d02-df7975912538.gif)  
    - 出品ページで詳細と条件を入力したら決定ボタンをクリック  
    ![出品画面](https://user-images.githubusercontent.com/69069717/104935359-79791900-59ee-11eb-9305-a393a5222b76.gif)  
    - トップページの下部一覧に貴方の出品したアイテムが現れます  
    - ログアウトして購入者用のアカウントへ変更  

  **2. 出品されているアイテムを購入する**  
    - ベージ下部の家具一覧の中から好きな物を選択  
    ![購入画面](https://user-images.githubusercontent.com/69069717/104935400-8433ae00-59ee-11eb-95c3-527ff6164c31.gif)
    - 出品者が設定している条件を見て、OKであれば住所とカード情報を入力して購入  
    ![購入決定画面](https://user-images.githubusercontent.com/69069717/104935452-99104180-59ee-11eb-833f-35d8108c095f.gif)  
    - sold outになったことを確認してログアウト

# :mortar_board: 目指した課題解決
  | ユーザーストーリーから考える課題           | 課題解決                                      |
  | --- | --- |
  | 家に物が溜まっている      | 誰か欲しがっている人に提供してあげられるようにする |
  | いらない物を売ってお金にしたい   | 条件を入力するだけで楽に販売ができる |
  | 自分好みのアイテムが欲しい    | オンラインで気軽にウインドウショッピングが楽しめる |
  


# :department_store: 機能一覧
|  機能 | 詳細 |
| --- | --- |
|  アイテム出品機能              | アイテムの情報、購入金額を入力する           |
|  アイテム一覧表示機能                    | トップページ下部に一覧としてアイテムを表示する            |
|  出品アイテム編集削除機能                    |出品者が自分のアイテムを編集、削除することができる |
|  ユーザー管理機能 | ユーザーが新規登録、ログイン、ログアウトをできるようにする            |
|  Payjpでのアイテム購入機能           | 掲示されているアイテムを住所とカード番号を入力することで購入できる。 | 
| 非同期機能                 | 出品価格を入力した際に手数料が非同期でし真下に表示される        | 
| AWS S3での画像アップロード                 | 画像がすぐに消えないようにする        | 
| AWSサーバーの利用 | [URL]http://18.181.104.37/ |  
  

# :stars: テーブル設計

## :small_red_triangle: users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email | string | null: false |
| encrypted_password | string | null: false, default: "" |
| last_name | string   |  null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items
- has_many :purchases


## :small_red_triangle: items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false, foreign_key: true |
| item_name | string | null: false |
| item_detail | text   |  null: false |
| category_id | integer | null: false |
| item_condition_id | integer | null: false |
| delivery_fee_id | integer | null: false |
| prefecture_id | integer | null: false |
| shipping_date_id | integer | null: false |
| price | integer | null: false |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_date


## :small_red_triangle: purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :ship_to_location


## :small_red_triangle: ship_to_locations テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal_code | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| address | string | null: false |
| building | string | |
| phone_num | string | null: false |
| purchase | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture
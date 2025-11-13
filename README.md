# ProtoSpace テーブル設計

## users テーブル

| カラム名 | 型 | オプション | 説明 |
|-----------|----|-------------|------|
| email | string | null: false, unique: true | メールアドレス（ユニーク制約あり） |
| encrypted_password | string | null: false | Deviseで暗号化されたパスワード |
| name | string | null: false | ユーザー名 |
| profile | text | null: false | 自己紹介文 |
| occupation | text | null: false | 職業 |
| position | text | null: false | 役職 |

### Association
- has_many :prototypes  
- has_many :comments


## prototypes テーブル

| カラム名 | 型 | オプション | 説明 |
|-----------|----|-------------|------|
| title | string | null: false | プロトタイプのタイトル |
| catch_copy | text | null: false | キャッチコピー |
| concept | text | null: false | コンセプト |
| user | references | null: false, foreign_key: true | 投稿したユーザー |

※ 画像（image）は ActiveStorage で実装するため含まれません。

### Association
- belongs_to :user  
- has_many :comments  
- has_one_attached :image


## comments テーブル

| カラム名 | 型 | オプション | 説明 |
|-----------|----|-------------|------|
| content | text | null: false | コメント本文 |
| prototype | references | null: false, foreign_key: true | コメント対象のプロトタイプ |
| user | references | null: false, foreign_key: true | コメントしたユーザー |

### Association
- belongs_to :user  
- belongs_to :prototype


## ER 図対応関係

User ---< Prototype ---< Comment
   \_____________________/
              |
          コメントもユーザーに紐づく


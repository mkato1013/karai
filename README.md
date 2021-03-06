# ð¥ã¢ããªã±ã¼ã·ã§ã³å  ãKARAIã

![karai-toppege](https://user-images.githubusercontent.com/87405282/132785018-9b29e819-963b-4e5f-9d72-b3c125d46a9f.jpeg)

## ã¢ããªã±ã¼ã·ã§ã³æ¦è¦ð»
è¾ãé£ã¹ç©ãå±æããã¢ããªã±ã¼ã·ã§ã³
è¾ãé£ã¹ç©ããããåºãèª¿ã¹ãããæ¢ããã¨ãå°ãé£ããã¨èãã
è²ããªãåºã®è¾ãé£ã¹ç©ããèªçã§è¾ãé£ã¹ç©ãä½ããã¨ãã§ããæãªã©ã
å±æã§ãããã¨ããæãã§ãä½æãã¾ããã

KARAIã·ãªã¼ãºã®ç¬¬2å¼¾ã®ãAMAIããä½æäºå®ã§ãã®ã§AMAIãã¿ã³ãããã¾ãã
*è¾ãé£ã¹ç©ãé£ã¹ãå¾ã«çãé£ã¹ç©ãå±æã§ãããã¨æãã¾ããã

![karaimovie](https://user-images.githubusercontent.com/87405282/132784762-16f52189-1448-44b5-a8d6-00ea7e30a404.gif)

## App URL
https://karai-app.herokuapp.com/

### ãã«ã½ãð¦ð©
- `è¾ããã®å¥½ã`ã§ããªããªãè¾ãé£ã¹ç©ãæ¢ããã¨ãã§ããªãæ¹
- `ãµã¯ãã¨`è¾ããã®ã`é£ã¹ãã`ç¤¾ä¼äºº
- è¾ããã®å¥½ããªä¸»å©¦ãä¸»å¤«ï¼`ããã¡ã®ãé£¯`ã®å±æï¼
- èªçã§è¾ãé£ã¹ç©ãã§ããæã®`ã¬ã·ãã¡ã¢`ããããæ¹

# ä½èð
- [Qiita](https://qiita.com/mkato1013)
- [Twitter](https://twitter.com/progmkatogorp)
- [Github](https://github.com/mkato1013)

# ãã¼ãã«è¨­è¨

## users ãã¼ãã«
ã¦ã¼ã¶ã¼ãç»é²ããéã«ã¯ãä»¥ä¸ã®`ã¦ã¼ã¶ã¼è¨­å®ã»ç·¨é`ãã§ãã¾ãã
- ã¡ã¼ã«ã¢ãã¬ã¹
- ä¸è¨ã³ã¡ã³ã
- ã¢ã¤ã³ã³

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| introduction       | text    |                           |

### Association

- has_many :foods
- has_many :likes
- has_many :relationships, foreign_key: :following_id
- has_many :followings, through: :relationships, source: :follower
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
- has_many :followers, through: :reverse_of_relationships, source: :following
- has_one_attached :icon

![karai-user](https://user-images.githubusercontent.com/87405282/132786925-4b617635-f0d8-4ea3-98b6-406b5604664b.gif)

## foods ãã¼ãã«
è¾ãé£ã¹ç©ãæç¨¿ããéã®`é ç®`ï¼å¿é ã»ä»»æï¼ã¯ä»¥ä¸ã®éãã§ãã
- ã«ãã´ãªã¼ï¼ã©ã¼ã¡ã³ãã«ã¬ã¼ãéå½æçãããã¡ãã¯ãããªã©ï¼
- åºå
- åºåï¼èª­ã¿æ¹ï¼
- ã¡ãã¥ã¼å
- è¾ãæ¡ç¹
- æå¯ãé§
- å¾ã¡æé
- æç¨¿ããé£ã¹ç©ã«é¢ããã³ã¡ã³ã

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| meal_type_id    | integer    |                              |
| shop_name       | string     | null: false                  |
| shop_name_kana  | string     |                              |
| food_name       | string     | null: false                  |
| spicy_level_id  | integer    | null: false                  |
| station         | string     |                              |
| shop_mood_id    | integer    |                              |
| waiting_time_id | integer    |                              |
| food_comment    | text       |                              |
| user            | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- has_many :likes
- has_many :liked_users, through: :likes, source: :user, dependent: :destroy
- has_one_attached :image
- has_many :comments, dependent: :destroy

![karai-food](https://user-images.githubusercontent.com/87405282/132786626-b98443a2-5b2f-45c6-8cfd-625dc663251a.gif)

## likes ãã¼ãã«
ã­ã°ã¤ã³ããã¦ã¼ã¶ã¼ã¯ãæç¨¿ã«å¯¾ãã¦`ããã­ï¼KALIKEï¼`ã§ãã¾ãã

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key:true  |
| food          | references | null: false, foreign_key:true  |

### Association

- belongs_to :user
- belongs_to :food

![karai-like](https://user-images.githubusercontent.com/87405282/132785508-2195b5a9-2e64-4c2a-871b-f51f80b3536e.gif)

## relationships ãã¼ãã«
ã­ã°ã¤ã³ããã¦ã¼ã¶ã¼ã¯ãè¾ãé£ã¹ç©ãããè¦ã¤ããããããã`ãã©ã­ã¼`ã§ããæ©è½ãå®è£ãã¦ãã¾ãã

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| following    | references | null: false, foreign_key: true |
| follower     | references | null: false, foreign_key: true |

### Association

- belongs_to :following ,class_name: "User"
- belongs_to :follower, class_name: "User"

![karai-follow](https://user-images.githubusercontent.com/87405282/132785762-b52e7e54-82e6-45c4-965c-ebf4f8cc1ebb.gif)

## comments ãã¼ãã«
ã­ã°ã¤ã³ããã¦ã¼ã¶ã¼ã¯ãæç¨¿ããé£ã¹ç©ã®`ã³ã¡ã³ããæç¨¿ã»é²è¦§`ãããã¨ãã§ãã¾ãã

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| food         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :food

![karai-comment](https://user-images.githubusercontent.com/87405282/132867741-879dc084-140f-4483-bd58-c514f95f0c24.gif)

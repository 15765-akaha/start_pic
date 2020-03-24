![START PIC-logo](https://user-images.githubusercontent.com/58874659/77296828-b4a5af80-6d2b-11ea-9ed4-4174ead14d65.png)

## [StartPic](http://start-pic.com/)とは
  写真を始めたい方や少しでも興味のある方を想定して作成した画像投稿サイトです。
  
  サイト側から提案されている写真のテーマを選び、投稿した写真を通じて交流やヒントを得ることができるシンプルなつくりになっています。

## サイト構造
　管理者サイトとユーザーサイトを設けています。  
 - 管理者は、ユーザーに対して写真の題材となるテーマを作成します。  
 またユーザー情報、投稿画像をリスト形式で確認できるようになっており、修正や削除対応ができます。
 - ユーザーは、テーマを基に画像を投稿します。主な機能は以下に記述。
 
## 機能（ユーザー）

#### 画像投稿機能  
ユーザーは自由に写真を投稿できるようになっています。 他に投稿コメントとタグを任意で追加して投稿することができます。 

しかし、必ず **写真のテーマを決定する必要**があります。

投稿ルートは以下２通りです。 

  1. Challengeリンクから、写真テーマ一覧ページに遷移しテーマの詳細ページから投稿する。  
        (開いているテーマが紐付いた状態で投稿。）
  2. ヘッダーナビのUploadから投稿する。  
        （投稿フォームの中に、テーマ選択のプルダウンが表示される。） 

#### いいね機能  
ユーザーは投稿された画像にいいねを押すことができます。いいねを押した画像はマイページにクリップされています。

いいねボタンはjQueryのmousecenterとmouseleaveによるイベント処理とAjaxによる非同期処理を搭載しているので

ファーストインプレッションを大切に画面遷移なしでいいねすることができます。

#### 称号機能  
ユーザーはachivement(称号）カラムを持っており、登録時にはデフォルトでBEGGINERがセットされます。

自身の投稿のいいね数に応じて、称号が3段階上昇します。（BEGGINER→ROOKIE→CHALLENGER→MASTER)

サイト内では、称号名はアイコンで表示されるようになっています。

いいねボタン同様のイベント処理を行ってどのランクのユーザーが投稿したかを一目で分かるようにしています

称号の判定に関してはいいねがされた段階で判定が行われるようになっており、新たな称号を獲得した場合は、  

獲得日が記録され、ユーザーページにて推移を確認することができます。

#### テーマ作成機能  
 上記の称号機能においてCHALLENGERを獲得した場合、管理者でなくてもテーマを作成することができます。
 
 また、作成した際に投稿がまだ無ければタイトルの編集や削除（論理削除）を行うことができます。
 
 管理者側では、どのユーザーはテーマを作成したかを把握できるようになっています。

#### その他機能  
  * 画像の詳細画面にてコメントをすることができます。
  
  * ユーザー情報にはフォローボタンがついており、気になるユーザーをフォローできます。
  
  * タグ検索機能、テーマタイトル検索機能
    
    
## 開発ツール

1. 開発言語  
    * rails 5.2.3
    * ruby 2.5.7
    
2. gem
    * devise(ユーザー認証機能)

    * refile、refile-mini_magick(画像アップロード機能)

    * bootstrap4.4.1（デザイン、石積みグリッド、レスポンシブ対応）
    
    ＊　jquery-rails
    
    *　kaminari(ページネーション)

    * acts-as-taggable-on(タグ機能）

3. デプロイ
    * AWS
    
## 開発に関して
 未経験からのエンジニア転職をめざして、初めてのポートフォリオを作成しました。  
 基本的なCRAD機能が出来るかどうかを中心に、ユーザー目線を意識したデザインや機能をつくりました。




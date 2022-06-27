# E.G.C ~Enjoy.Gaming.Community

## サイト概要
### サイトテーマ
同じゲームをしている仲間で集まってチームを組んで大会を目指したり、皆でワイワイ盛り上がりたい人やみんながおすすめしているゲームを探すことができるコミュニティサイトです。

### テーマを選んだ理由
子供の頃から今もゲーマーで、自分自身ゲーム仲間が欲しいけどなかなか見つからなかったり
新しく何かゲームを始めたいけど何がいいかなぁと思うことも多くありゲームに特化したサービスとかあると便利だろうなと思いました。
さらにここ数年で「e-sports」の人気もありゲーム需要も高くなっているのでもっと同じゲームをしている人と交流を持ったり
このサイトを通じて新しいゲームの発見をして、始めるきっかけになればいいなと思いこのテーマにしました。

### ターゲットユーザー
- みんなで楽しくゲームをしたい人
- おすすめのゲームを探している人
- ゲームを始めたいけど何がいいのかわからない人
- ゲームのチームを作りたいと思っている人

### 主な利用シーン
- 1人でゲームをしているけど、誰かと一緒にやりたいなと思った時
- 新しいゲームを始めたいけど何が良いか分からない時
- チームを作って大会に出たいけどメンバーが見つからない時
- 人気のゲームが何か知りたい時

## 設計書
- ER図　=> https://app.diagrams.net/#G1Q2tFarHv-gSXc4QEb46nk8-IhoI1XNNC
- テーブル提議書 => https://docs.google.com/spreadsheets/d/1Va4w7Rtxun5FZTdcbjTxaDgfQjuE6Sy5OgswmPo6Pgs/edit#gid=330628383
- アプリケーション詳細設計 => https://docs.google.com/spreadsheets/d/1dYELTMZjlhUO8mWb7pRrmKfxazEmSJZTTpaRNXK_uV4/edit#gid=2133469642

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 機能一覧
-  ★ユーザー側
- 　・ユーザー認証（新規登録/ログイン/ログアウト)
- 　・ゲストログイン
- 　・投稿機能(一覧表示、詳細表示、新規投稿、投稿削除)
- 　・いいね(非同期化)
- 　・コメント(非同期化)
- 　・会員機能(マイページ/詳細/編集/画像アップロード/退会ステータス)
- 　・フォロー・フォロワー機能
- 　・フォロー・フォロワーの一覧表示
- 　・グループ機能(作成/編集/参加/脱退/画像アップロード/イベントメール)
- 　・検索機能(ユーザと投稿の２つを条件分岐で絞り込み検索可能)
- 　・タグ検索(投稿内容をジャンルでタグ検索)
- ★管理者側
- 　・ユーザー認証(ログイン/ログアウト)
- 　・ユーザー管理(一覧表示/詳細表示/編集/画像アップロード/退会ステータス)
- 　・投稿管理(一覧表示/詳細表示/編集/削除)
- 　・コメント管理(非同期化)
- 　・ジャンル機能(新規作成/一覧画面/編集)
- 　・検索機能(ユーザと投稿の２つを条件分岐で絞り込み検索可能)

## テスト確認
- テスト仕様書=> https://docs.google.com/spreadsheets/d/1G1oqZfGwHUZ3DVD2Ape3Dqc2KXHQJVEh/edit#gid=345879295

## 使用素材
- O-DAN様から画像を使用させてもらっています
- 下記のURLより
- https://o-dan.net/ja/

## 管理者側説明
### 管理者側のログインページは/admin/sign_in <=をURL直打ちで遷移
- Eメール => sample@admin.com
- パスワード => 123456
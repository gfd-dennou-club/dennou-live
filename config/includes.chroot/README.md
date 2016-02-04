Debian Live DVD/USB (Jessie) with GFD-Dennou Club dcmodel/davis product
========================================================================

Copyright(c) 2015-2016: Youhei SASAKI <uwabami@gfd-dennou.org>

はじめに/ 追加情報など
----------------------

Debian Live DVD 制作後の追加情報や訂正は以下の URI にてアナウンスされます.
この文書とあわせてお読みください.

  http://www.gfd-dennou.org/arch/cc-env/live-usb-dvd/index.htm

目次
----

* Debian Live について
  1. Live DVD/USB として使う
  2. DVD の差分を USB メモリに保存する
  3. よくある質問
* Debian Live のカスタマイズ


Debian Live について
--------------------

この DVD/USB は, Debian Live Project の live-build (=> 4.0~) を用いて制
作されました. Debian GNU/Linux 8.3 (Jessie)ベースで作られており, 地球流
体電脳倶楽部のソフトウェアを気軽に試せるようになっています.

Live DVD/USB として使う
-----------------------

Debian Live を起動するにはメニューの「Live」を選択します. それぞれのメ
ニューは以下のようになっています.

* amd64:
  * Intel Pentium IV 以降，64bit モードで起動します．

* amd64 (fail-safe)
  * すべてのオプションを無効にして起動するモードです.うまく起動できない場
    合に試してみてください.

起動時のパラメータを追加するには, メニューの上で TAB キーを押して追加します.

DVD の差分を USB メモリに保存する
---------------------------------

Debian Live は, 起動時に「persistence」というラベル名の ext2/3/4 パーティ
ションをみつけると自動的にマウントし, DVD の差分を保存します. DVD から起
動し, 変更を保存したい場合には, ラベルをつけた USB メモリを用意して下さ
い.

尚, 実習時に配布した USB の場合は, persistence ラベルを付与してあり, 全
ての変更内容を保存するようにしてあります.

よくある質問
-------------

* Q. ネットワークに接続するには?
* A. network-manager を使用します. 
  * 右上のネットワークのアイコンをクリックして設定して下さい.

* Q. ログイン画面に戻ってしまいました/ロックされてしまいました.
* A. ユーザー名とパスワードは以下のとおりです.

  > ユーザー名: user
  > パスワード: live

* Q. 日本語入力はどうするの?
* A. uim-anthy を入れてあります．Super(Windowsキー or Commandキー) + SPACE で切り替え可能です．

* Q. root 権限を取得するには, どうすればいいですか?
* A. sudo を使って下さい.

* Q. キーボードが英語(日本語)キーボード配列になっている
* A. lightdm のログイン画面で日本語(英語)キーボードを選択してください.

Debian Live のカスタマイズについて
-----------------------------------

今回配布した DVD/USB のイメージを作成するためのレシピは github で公開して
います. カスタマイズをおこなうには Debian GNU/Linux 上で作業をする必要が
ありますが, Live DVD 上からもカスタマイズは可能ですので, 興味のある方はチャ
レンジしてみたください.

カスタマイズには 10GB 程度の保存領域が必要になるので, USB 接続 HDD などを
用意して保存領域を確保する必要があります.

ビルドの方法は, 以下のコマンドによりビルドすることができます.

 $ git clone git://github.com/uwabami/dennou-live.git
 $ cd dennou-live.git
 $ make

live-build の設定については, Debian Live のサイトを見るのが一番です. 日本
語の資料では, 関西 Debian 勉強会の資料があるのでそれを参考にするとよいで
しょう.

関西 Debian 勉強会  資料
http://tokyodebian.alioth.debian.org/pdf/debianmeetingresume200906-kansai.pdf

DebianLive - Debian Wiki (英語)
http://wiki.debian.org/DebianLive

Debian Live Manual (英語)
http://live.debian.org/live-manual/html/

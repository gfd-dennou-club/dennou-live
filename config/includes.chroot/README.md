Debian Live DVD/USB (Buster) with GFD Dennou Club dcmodel/davis product
========================================================================

* Copyright(c) 2015-2021: Youhei SASAKI <uwabami@gfd-dennou.org>
* LICENSE: GPL-2+

はじめに/ 追加情報など
----------------------

本リポジトリから作成された Debian Live DVD の追加情報や訂正は以下の URI
にてアナウンスされます．この文書とあわせてお読みください．

  https://www.gfd-dennou.org/arch/cc-env/live-usb-dvd/index.htm

目次
----

* Debian Live について
  1. Live DVD/USB として使う
  2. DVD の差分を USB メモリに保存する
  3. よくある質問
* Debian Live のカスタマイズ


Debian Live について
--------------------

この DVD/USB は Debian Live Project の live-build を用いて制作されました．
Debian GNU/Linux 10 (Buster)ベースで作られており，地球流体電脳倶楽部のソ
フトウェアを気軽に試せるようになっています．

Live DVD/USB として使う
-----------------------

Debian Live を起動するにはメニューの「Live」を選択します．それぞれのメ
ニューは以下のようになっています.

* amd64:
  * Intel Pentium IV 以降，64bit モードで起動します．
* amd64 (fail-safe)
  * すべてのオプションを無効にして起動するモードです．
    うまく起動できない場合に試してみてください．
* Install および Graphical Install
  * Liveイメージに同梱されているパッケージに基づいた
    Debian GNU/Linux 10 環境をインストールします．
* memtest86+
  * ハードウェアのメモリテストにご利用下さい. 

起動時のパラメータを追加する場合は，メニューの上で TAB キーを押して下さい．
画面下部にプロンプトが表われます．


素の環境からの変更点
--------------------

* ユーザー名とパスワードは以下のとおりです．
   > ユーザー名: user
   > パスワード: live
* Desktop 環境は XFce4 です. 
* 日本語入力環境として uim-mozc を利用する様にしてあります．Emacs ユーザ
  の利便性を考慮して，日本語入力の切替は「Super + Space」(Win + Space or
  Cmd + Space) もしくは「半角/全角」としてあります．
* フォント設定は以下の通りです．`~/.config/fontconfig/fonts.conf` をご覧下さい．
   >  serif: IPA 明朝
   >  san-serif: IPA ゴシック
   >  monospace: VL ゴシック
   >  Ryumin: IPAPMincho      <-- IPAexMincho に変更予定
   >  GothicBBB: IPAPGothic   <-- IPAexGothic に変更予定
* (u)pTeX 環境が IPAex フォントを埋め込むようにしてあります．

DVD の差分を USB メモリに保存する
---------------------------------

Debian Live は，起動時に`persistence`というラベル名の ext2/3/4 パーティ
ションをみつけると自動的にマウントし，ライブ起動後の差分を保存します．
Live システムを起動した後に変更を保存したい場合には，ラベルをつけた USB
メモリを用意して下さい．

実習時に配布した USB は persistence ラベルを付与してあり，全ての変更内容
を保存するようにしてあります．


よくある質問
-------------

* Q．ネットワークに接続するには?
* A．network-manager を使用します．
  * 右上のネットワークのアイコンをクリックして設定して下さい．

* Q．ログイン画面に戻ってしまいました/ロックされてしまいました．
* A．ユーザー名とパスワードは以下のとおりです．

  > ユーザー名: user
  > パスワード: live

* Q．root 権限を取得するには, どうすればいいですか?
* A．sudo を使って下さい.

* Q．キーボードが英語(日本語)キーボード配列になっている
* A．lightdm のログイン画面で日本語(英語)キーボードを選択してください．

Debian Live のカスタマイズについて
-----------------------------------

今回配布した DVD/USB のイメージを作成するためのレシピはgithub で公開して
います．カスタマイズをおこなうには Debian GNU/Linux 上で作業をする必要が
あります．興味のある方は是非チャレンジしてみたください．

カスタマイズには 10GB 程度の保存領域が必要となります．
とりあえずは以下のコマンドによりビルドすることができます.

       % git clone git://github.com/gfd-dennou-club/dennou-live.git
       % cd dennou-live.git
       % make

* make 時に必要なパッケージが足りないとエラーが出ます．必要なパッケージ
  をインストールして下さい．

live-build でのカスタマイズ方法はマニュアルを読むのが一番です．
`live-manual` パッケージを導入することで txt, html, pdf, epub 等様々な形
式のマニュアルが読めるようになります．

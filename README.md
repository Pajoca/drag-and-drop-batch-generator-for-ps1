# .ps1をもとにダブルクリック実行可能な.batを自動作成
## 概要
PowerShellスクリプトをダブルクリックで実行できる配布用バッチファイルを、ps1ファイルから自動で生成できるツールです。

ツール本体に.ps1ファイル(または.ps1を含んだフォルダ)をドラッグ＆ドロップするだけで、同ディレクトリに.ps1を呼び出すバッチファイルを自動生成します。

ダブルクリック実行ができない.ps1の代わりにツールで生成した.batをダブルクリックすれば、元の.ps1が呼び出され簡単にスクリプトを実行できます。

CC0で著作権を完全に放棄しているのでどなたでもご自由にお使いいただけます。\(パブリックドメイン\)

### 詳しいドキュメントとダウンロード先
本ツールの使い方\(画像付き\)や細かな仕様、コードの説明など必要な情報は全て私のWebサイトにまとめてありますので、**ツールご利用の方は以下のリンク先を主にご参照ください。**

[**リンク：ツールの使い方・機能**](https://pajoca.com/ps1-batch-generator/)

\(一応このREADME.mdでも使用に必要な情報は一通り説明していますが、上記リンクページの方が画像付きで詳しい説明になっています。\)

ツールのダウンロードは[GitHubのReleasesページ](https://github.com/Pajoca/drag-and-drop-batch-generator-for-ps1/releases)で可能です。\(zipファイル\)


## 配布用バッチとは
### 普通のPowerShellスクリプト\(.ps1\)を配布すると実行が面倒
せっかく自分で作った便利なPowerShellスクリプトを配布してみんなに使ってもらいたいと思っても、スクリプトの実行には色々と手間がかかるためユーザーは気軽に実行できません。

次のように極めて不便な仕様があります。\(デフォルト設定において\)
* .ps1ファイルをダブルクリックしてもスクリプトは実行されない
* 標準ではコマンドプロンプトやPowerShellプロンプトから実行する必要がある
* デフォルトでPowerShellスクリプトの実行は無効に設定されているため、実行ポリシーの変更が別途必要\(要コマンド操作\)
* Web上から入手したPowerShellスクリプトは、ユーザーの環境で設定されている実行ポリシーによっては実行が不可or実行時に許可を与える手間が生じる

さすがにここまで制約が多いと、配布したスクリプトを気軽に使ってもらうことができません…。


### ユーザーが何も考えずダブルクリックで実行できるように
従来のバッチファイル\(.bat\)ならダブルクリック実行が可能なため、**バッチファイルからPowerShellスクリプトを呼び出す仕様**にすればユーザーはバッチをダブルクリックするだけで済みます。

本ツールに.ps1ファイルをドラッグ＆ドロップして渡せば、**その.ps1ファイルを起動するバッチファイルを自動で生成**できます。

あとは生成したバッチと.ps1ファイル本体を一緒に配布するだけでOKです。

\(バッチと.ps1ファイルが同じディレクトリにあれば、どの場所に配置されてもバッチから.ps1を呼び出して実行可能です。\)


## 使い方：配布用バッチの作成
ツール本体は「**D＆Dで配布用バッチ生成(本体).bat**」です。

このツールに.ps1ファイル、または.ps1ファイルが入ったフォルダを任意個数ドラッグ＆ドロップしてください。

ドラッグ＆ドロップされた.ps1ファイルと同名のバッチが、その.ps1ファイルと同じディレクトリに生成されます。

フォルダをドラッグ＆ドロップした場合、そのフォルダ直下の.ps1ファイルに対応するバッチがフォルダ内に生成されます。

\(フォルダ内に.ps1以外のファイルが含まれていても処理対象から除外されるので問題ありません。\)

試しに「スクリプトサンプル」フォルダを「**D＆Dで配布用バッチ生成(本体).bat**」にドラッグ&ドロップすれば動作がわかります。


## 使い方：バッチの実行
バッチを配布されたユーザーは、そのバッチをダブルクリックするだけで実行可能です。

PowerShellの実行ポリシー設定変更やコマンドプロンプトの起動などの操作はユーザー側で一切やる必要がありません。

\(バッチにドラッグ&ドロップでファイルを渡して起動する方法や、コマンドでバッチを実行する方法も使用可能です\)

### SmartScreen画面の表示について
ユーザー側のWindows設定によっては「Windows によって PC が保護されました」というSmartScreen画面が表示されることがあります。

詳細情報 → 実行　とクリックすることでバッチを起動可能です。

画像で起動手順を説明した「**対処法：WindowsによってPCが保護されましたと表示されたら.png**」を用意したので、スクリプト配布者は配布フォルダに同梱しておけばユーザーが起動に困らないと思います。


## 機能と仕様
### バッチにドラッグ&ドロップされたファイル名を.ps1側で利用可能
バッチファイルにドラッグ&ドロップされたファイルの絶対パスが引数としてそのままPowerShellスクリプト側に渡される仕様です。

例えば渡されたファイルの名前を指定ルールで一括変更する処理の.ps1を作成した時、ユーザーはバッチに名前を変更したいファイルorフォルダをドラッグ&ドロップするだけで実行可能です。

「**スクリプトサンプル**」フォルダの「**バッチにD＆Dされたファイルのパスを表示.ps1**」で、.ps1側でどのようにファイルパスを受け取っているかご確認ください。


### バッチは相対パスで同ディレクトリ内の.ps1を指定して起動
バッチが起動する.ps1ファイルは相対パスで指定されているので、バッチと.ps1が同じ場所にあれば、その2つのセットをユーザーがどの場所に移動しても起動できます。

同ディレクトリ以外の相対パスを指定したい場合はバッチファイルを開き、
```batch
powershell -ExecutionPolicy Bypass -File ".スクリプト名.ps1" %*
```
の行でダブルクォートでくくられている相対パス部分を編集してください。

※毎回この操作を行う必要がある場合は「**D＆Dで配布用バッチ生成_code.ps1**」のスクリプトを編集すれば動作を変更できます。


### バッチ名は自由に変更可能
ユーザーがどのファイルを実行すれば良いのか分かるように、バッチ名を「○○ツール\(本体\)」などと変更しておくとわかりやすいかもしれません。

生成したバッチは後から自由に名前を変更できます。

ただし、**.ps1側の名前を変更した場合は改めてバッチを再生成する必要がある**のでご注意ください。


### ユーザー側の環境設定を勝手に変更しない
バッチファイルから呼び出す.ps1に限って一時的に実行ポリシーを緩めて\(Bypassにして\)実行する仕様なので、勝手に恒久的にユーザー側の実行ポリシーを変更する仕様ではありません。

.ps1側で処理を実装しない限り、バッチ実行前後でユーザー側の環境設定に影響を与えません。


### ネットワークフォルダ上での実行も可能\(だと思う\)
一応ツール本体のバッチ上では`cd`ではなく`pushd`でバッチ本体があるディレクトリに移動しているので、多分ネットワークフォルダ上でのバッチ実行も可能だと思います。

ただし検証していません。

\(もし検証された方がいらっしゃいましたら教えていただけるとありがたいです。\)


### .ps1スクリプトの名前の制約
.ps1ファイル名に大かっこ\[ \] が入っているとおそらく正常に動作しないと思うのでご注意ください。\(大かっこがワイルドカード文字列として認識されてしまう\)

\(本ツールの.ps1コードで`Split-Path`コマンドを使用したのですが、パスを文字通り認識する`-LiteralPath`を指定すると`-Parent`オプションが使えなくなるので、代わりにワイルドカードを認識してしまう`-Path`を指定せざるを得ませんでした。\) 


# ライセンス
Pajoca\(パジョカ\) はこのツール・ソースコードの全ての著作権および関連する権利を[CC0](https://creativecommons.org/publicdomain/zero/1.0/deed.ja)により放棄しています。
つまり、このツールで生成したバッチファイルの自由な配布はもちろんのこと、このツール自体も自由に変更・再配布可能で商用・非商用問わず一切の許諾・クレジット表示なしに自由にお使いいただけます。

むしろどんどん自由に使って広めてもらって、必要な方にツールが伝われば凄く嬉しいです！

ツール本体・スクリプトサンプル・本README.mdなどすべてのファイルがCC0ですので、単純にGitHubでツールを配布するときのテンプレートとして利用するなど本来と異なる用途でもお使いいただけます。

※このツールを改変したものを配布する際に私と同じように著作権を放棄する必要はありません！\(法の範囲内で最大限の自由な利用が可能です\)

\(このツールに機能を追加して勝手に有料で販売するのもOK！\)

※ただしCC0にて明記されている通り、本リポジトリにはいかなる保証もせず、ご利用により発生したいかなる損害にも責任を追わないのでその点はご了承ください。


# 今後の機能追加予定
* ネットワークフォルダでの利用可否の確認。
* バッチ自体に.ps1のコードを埋め込めば、バッチファイル単独で実行可能にできる？ ただし.ps1ファイルが無くなるとユーザーが自前でスクリプトをカスタムしにくくなる。実行前にコードの安全性を確認したいユーザーとしても別にしたほうが良さそう…? (需要に応じて検討)
* その他要望に応じてツールの改善


# 開発者向け情報
## コードの説明
コードの内容や仕様、このような設計にした理由などの情報は全て以下リンク先にまとめました。

[**リンク：使い方・コード説明**](https://pajoca.com/ps1-batch-generator/)

## 修正や機能追加について
もし何か本ツールに関して修正案や機能追加案がございましたら教えていただけると非常にありがたいです。

ただ、このツールは著作権を放棄して配布しておりますので、提案により追加させていただいた機能部分も含め全て著作権を放棄した状態で一般公開することになります。

その点はご留意いただきますようよろしくお願いいたします。

これに問題がある場合は代わりに、このツールをコピーして改変したものを自前でお好きなライセンスの下で公開していただいて問題ありません。


# 最後に (その他注意事項)
そもそもPowerShellスクリプトの実行が元々非常に不便な仕様になっているのはセキュリティ上の対策であるため本来はスクリプトを気軽に実行できてしまうのはよろしくないのですが、社内や信頼できる人同士でのスクリプトの配布時なら便利に使えると思います。

「配布用」という名称ですが別に配布せず個人で使用する場面でも便利に使えると思います。自前で書いたPowerShellスクリプトを手軽にダブルクリック実行できるのは便利です。
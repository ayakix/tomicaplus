おもちゃとiPhone連携してみた
===============

[![](https://img.youtube.com/vi/zV4Zf02n9YA/0.jpg)](https://www.youtube.com/watch?v=zV4Zf02n9YA)

## 説明
ステイホームで頑張る坊っちゃんのために、NFCタグを底に貼り付けたおもちゃをiPhoneの上に置くと、対応した画像を表示し、効果音を鳴るようにしてみた。

# 使い方
## ビルド方法

著作権の関係で画像と効果音は省いてあります。

画像は [いらすとや](https://www.irasutoya.com/) のものを使っています。それっぽい画像をダウンロードし、列挙型Vehicleに宣言しているcase(ambulance, bus...)の名前で、 Assets.xcassets > xxx.imageset > xxx.pngのファイルをそれぞれ上書きしてください。

効果音は [効果音ラボ](https://www.irasutoya.com/search?q=%E6%95%91%E6%80%A5%E8%BB%8A) さんのものを使っています。それっぽい音源をダウンロードし、mp3ファイルをそれぞれ上書きしてください。

特に外部ライブラリは使用していないため、そのままビルドできると思います。

## NFCタグの準備

今回は [サンワサプライのNFCタグ](https://amzn.to/3btdBII) を使いました。シールになっているので、おもちゃの底に簡単に貼り付けることができます。10枚入りで、１枚130円ほどでした。

![nfc_tag](https://github.com/ayakix/tomicaplus/raw/master/nfc_tag.jpg)

NFCタグに書き込みを出来るアプリ [NFC Tools](https://apps.apple.com/jp/app/nfc-tools/id1252962749) 等を利用して、列挙型Vehicleに宣言しているcase(ambulance, bus...)名をテキストレコードとして追加します。

![nfc_write](https://github.com/ayakix/tomicaplus/raw/master/nfc_write.jpg)

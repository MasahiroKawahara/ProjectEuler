# -*- coding: utf-8 -*-
# (訳者注: 文字コードの説明は適当です) 各文字はそれぞれ一意のコードに割り当てられている. よく使われる標準としてASCII (American Standard Code for Information Interchange) がある. ASCIIでは, 大文字A = 65, アスタリスク (*) = 42, 小文字k = 107というふうに割り当てられている.

# モダンな暗号化の方法として, テキストファイルの各バイトをASCIIに変換し, 秘密鍵から計算された値とXORを取るという手法がある. XOR関数の良い点は, 暗号化に用いたのと同じ暗号化鍵でXORを取ると平文を復号できる点である. 65 XOR 42 = 107であり, 107 XOR 42 = 65である.

# 破られない暗号化のためには, 鍵は平文と同じ長さのランダムなバイト列でなければならない. ユーザーは暗号文と暗号化鍵を別々の場所に保存する必要がある. また, もし一方が失われると, 暗号文を復号することは不可能になる.

# 悲しいかな, この手法はほとんどのユーザーにとって非現実的である. そこで, 鍵の変わりにパスワードを用いる手法が用いられる. パスワードが平文より短ければ (よくあることだが), パスワードは鍵として繰り返し用いられる. この手法では, 安全性を保つために十分長いパスワードを用いる必要があるが, 記憶するためにはある程度短くないといけない.

# この問題での課題は簡単になっている. 暗号化鍵は3文字の小文字である. cipher1.txtは暗号化されたASCIIのコードを含んでいる. また, 平文はよく用いられる英単語を含んでいる. この暗号文を復号し, 平文のASCIIでの値の和を求めよ.

CODE_SP = 32 #スペースのASCIIコード

def main
  ws = []
  File.foreach(ARGV[0]){|l|
    ws =  l.split(",").map{|s| s.to_i}
  }
  w1,w2,w3 = get_code_count_dics(ws)
  key1,key2,key3 = guess_key(w1),guess_key(w2),guess_key(w3)
  puts decrypt(ws,key1,key2,key3).inject(:+)
end

#復号化関数
def decrypt(ws,k1,k2,k3)
  wss = []
  keys = [k1,k2,k3]
  roop = 0
  ws.each{|c|
    wss << (c ^ keys[roop%3])
    roop += 1
  }
  wss
end

#最頻出の文字がスペースと仮定して，暗号化の文字を求める
def guess_key(wd)
  enc_sp = wd.max_by{|k,v| v}.first #暗号化後のスペースの文字コードを取得
  CODE_SP ^ enc_sp
end

#3文字置きの，文字とその出現数のハッシュリストを返す
def get_code_count_dics(ws)
  dics = [{},{},{}]
  roop = 0
  ws.each{|w|
    idx = roop%3
    if dics[idx][w] == nil
      dics[idx][w] = 1
    else
      dics[idx][w] += 1
    end
    roop += 1
  } 
  dics
end

main

#復号化の結果(ネタバレ注意)
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# (The Gospel of John, chapter 1) 1 In the beginning the Word already existed. He was with God, and he was God. 2 He was in the beginning with God. 3 He created everything there is. Nothing exists that he didn't make. 4 Life itself was in him, and this life gives light to everyone. 5 The light shines through the darkness, and the darkness can never extinguish it. 6 God sent John the Baptist 7 to tell everyone about the light so that everyone might believe because of his testimony. 8 John himself was not the light; he was only a witness to the light. 9 The one who is the true light, who gives light to everyone, was going to come into the world. 10 But although the world was made through him, the world didn't recognize him when he came. 11 Even in his own land and among his own people, he was not accepted. 12 But to all who believed him and accepted him, he gave the right to become children of God. 13 They are reborn! This is not a physical birth resulting from human passion or plan, this rebirth comes from God.14 So the Word became human and lived here on earth among us. He was full of unfailing love and faithfulness. And we have seen his glory, the glory of the only Son of the Father.

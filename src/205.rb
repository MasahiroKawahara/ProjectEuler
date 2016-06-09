# -*- coding: utf-8 -*-
# ピーターは4面のサイコロを9つ持っている. サイコロの各面には1, 2, 3, 4と書いてある. コリンは6面のサイコロを6つ持っている. サイコロの各面には1, 2, 3, 4, 5, 6と書いてある.

# ピーターとコリンはサイコロを投じ, 出た目の合計を比べる. 合計が多い方が勝ちである. もし出た目の合計が等しければ勝負は引き分けになる.

# ピーターがコリンに勝つ確率はいくつだろうか? 10進7桁にroundし, 0.abcdefgという形で回答欄に入力せよ.

DICE_4 = [1,2,3,4]
DICE_6 = [1,2,3,4,5,6]

def main
  #peter[i]: peter がスコアi を出す確率
  peter = (6..36).map{|i| [i,0]}.to_h
  DICE_4.repeated_permutation(9).each{|a|
    peter[a.inject(:+)] += 1/262144r #1/4^9
  }
  #colin[i]: colin がスコアi を出す確率
  colin = (6..36).map{|i| [i,0]}.to_h
  DICE_6.repeated_permutation(6).each{|a|
    colin[a.inject(:+)] += 1/46656r #1/6^6
  }
  #peterがスコアi (範囲9~36) で勝つ確率の和を求める
  puts (9..36).map{|i|
    peter[i]*prob_of_peter_win(i,colin)
  }.inject(:+).to_f.round(7)
end

#peterがスコアpi で勝つ確率
def prob_of_peter_win(pi,colin)
  colin.select{|ci,prob|
    ci < pi
  }.values.inject(:+)
end

main

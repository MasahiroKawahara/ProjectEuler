# -*- coding: utf-8 -*-
# 5000個以上の名前が書かれている46Kのテキストファイル filenames.txt を用いる. まずアルファベット順にソートせよ.

# のち, 各名前についてアルファベットに値を割り振り, リスト中の出現順の数と掛け合わせることで, 名前のスコアを計算する.

# たとえば, リストがアルファベット順にソートされているとすると, COLINはリストの938番目にある. またCOLINは 3 + 15 + 12 + 9 + 14 = 53 という値を持つ. よってCOLINは 938 × 53 = 49714 というスコアを持つ.

# ファイル中の全名前のスコアの合計を求めよ.

SUB = "A".ord - 1

def main
  names = parse(ARGV[0])
  names.sort!
  sum = 0
  names.size.times{|index|
    sum += score(index,names[index])
  }
  puts sum
end

def score(index, name)
  (index + 1) * name.split("").map{|c| char_score(c)}.inject(:+)
end

def char_score(c)
  c.ord - SUB
end

def parse(f)
  ns = []
  open(ARGV[0]){|f|
    ns = f.readlines[0]
  }
  ns.split(",").map{|n| n[1..-2]}
end

main

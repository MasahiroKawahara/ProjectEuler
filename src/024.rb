# -*- coding: utf-8 -*-
# 順列とはモノの順番付きの並びのことである. たとえば, 3124は数 1, 2, 3, 4 の一つの順列である. すべての順列を数の大小でまたは辞書式に並べたものを辞書順と呼ぶ. 0と1と2の順列を辞書順に並べると

# 012 021 102 120 201 210
# になる.

# 0,1,2,3,4,5,6,7,8,9からなる順列を辞書式に並べたときの100万番目はいくつか?

NS = [0,1,2,3,4,5,6,7,8,9]
IDX = 1000000

def main
  puts get_nth_permutation(NS,IDX).join("")
end

#ns(辞書順に並んでいるとする) からなる順列のidx 番目を求める．
def get_nth_permutation(ns, idx)
  if ns.size == 1
    ns
  else
    sz = ns.size
    top, div = (0...sz).map{|k| [ns[k], 1 + k * fact(sz - 1)]}.select{|n,i| i <= idx}.max_by{|n,i| i}
    [top] + get_nth_permutation(ns - [top], idx - div + 1)
  end
end

def fact(n)
  (1..n).inject(:*)
end

main

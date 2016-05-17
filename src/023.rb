# -*- coding: utf-8 -*-
# 完全数とは, その数の真の約数の和がそれ自身と一致する数のことである. たとえば, 28の真の約数の和は, 1 + 2 + 4 + 7 + 14 = 28 であるので, 28は完全数である.

# 真の約数の和がその数よりも少ないものを不足数といい, 真の約数の和がその数よりも大きいものを過剰数と呼ぶ.

# 12は, 1 + 2 + 3 + 4 + 6 = 16 となるので, 最小の過剰数である. よって2つの過剰数の和で書ける最少の数は24である. 数学的な解析により, 28123より大きい任意の整数は2つの過剰数の和で書けることが知られている. 2つの過剰数の和で表せない最大の数がこの上限よりも小さいことは分かっているのだが, この上限を減らすことが出来ていない.

# 2つの過剰数の和で書き表せない正の整数の総和を求めよ.

require 'prime'

MIN = 12
BOUND = 28123

def main
  #過剰数のリストの取得
  abundants = (MIN..BOUND).select{|n| n < get_divisors_sum(n)}
  #2つの過剰数の和で表せない正の整数の総和を求める．
  num_hash = Hash[*(1..BOUND).map{|n| [n,:non_abund_sum]}.flatten]
  abundants.size.times{|x|
    (x...abundants.size).each{|y|     
      num_hash[abundants[x]+abundants[y]] = :abund_sum
    }
  }
  p num_hash.select{|k,v| v == :non_abund_sum}.keys.inject(:+)
end

#約数の和を求める
def get_divisors_sum(n)
  factors = Prime.prime_division(n)
  factors.map{|p,k| facts_sum(p,k)}.inject(:*) - n
end

#1 + n + n^2 + ... + n^k を計算する．
def facts_sum(n,k)
    (0..k).map{|i| n**i}.inject(:+)
end

main


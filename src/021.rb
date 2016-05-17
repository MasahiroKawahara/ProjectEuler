# -*- coding: utf-8 -*-
# d(n) を n の真の約数の和と定義する. (真の約数とは n 以外の約数のことである. )
# もし, d(a) = b かつ d(b) = a (a ≠ b のとき) を満たすとき, a と b は友愛数(親和数)であるという.

# 例えば, 220 の約数は 1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110 なので d(220) = 284 である.
# また, 284 の約数は 1, 2, 4, 71, 142 なので d(284) = 220 である.

# それでは10000未満の友愛数の和を求めよ.

require 'prime'

BOUND = 10000

def main
  divisors_sum = {}
  #9999 までの約数の和を求める
  (2...BOUND).each{|n|
    divisors_sum[n] = get_divisors_sum(n)
  }
  #友愛数の和を求める
  puts divisors_sum.select{|k,v|
    k == divisors_sum[divisors_sum[k]] && k != divisors_sum[k]
  }.keys.inject(:+)
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

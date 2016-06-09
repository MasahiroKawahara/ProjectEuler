# -*- coding: utf-8 -*-
# オイラーは以下の二次式を考案している:

# n^2 + n + 41.
# この式は, n を0から39までの連続する整数としたときに40個の素数を生成する. しかし, n = 40 のとき 402 + 40 + 41 = 40(40 + 1) + 41 となり41で割り切れる. また, n = 41 のときは 412 + 41 + 41 であり明らかに41で割り切れる.

# 計算機を用いて, 二次式 n^2 - 79n + 1601 という式が発見できた. これは n = 0 から 79 の連続する整数で80個の素数を生成する. 係数の積は, -79 × 1601 で -126479である.

# さて, |a| < 1000, |b| < 1000 として以下の二次式を考える (ここで |a| は絶対値): 例えば |11| = 11 |-4| = 4である.

# n^2 + an + b
# n = 0 から始めて連続する整数で素数を生成したときに最長の長さとなる上の二次式の, 係数 a, b の積を答えよ.

require 'prime'

def main
  max_a, max_b, max_length = 0,0,0
  #a は奇数
  (-999..999).select{|a| a%2 != 0}.each{|a|
    #b は正の素数
    Prime.each(1000).each{|b|
      length = primes_length(a,b)
      if max_length < length
        max_a, max_b, max_length = a, b, length
      end
    }
  }    
  puts max_a * max_b
end

#a,b の場合の最長素数列の長さを求める
def primes_length(a,b)
  n = 0
  while Prime.prime?(n*n + a*n + b)
    n += 1
  end
  n
end 

main

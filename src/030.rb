# -*- coding: utf-8 -*-
# 驚くべきことに, 各桁を4乗した数の和が元の数と一致する数は3つしかない.

# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# ただし, 1=1^4は含まないものとする. この数たちの和は 1634 + 8208 + 9474 = 19316 である.

# 各桁を5乗した数の和が元の数と一致するような数の総和を求めよ.

#5乗の範囲 0 ~ 59049
#桁数n の数ついて，10^(n-1) <= 59049*n であれば 5乗和一致の可能性がある．

GOJO = [0,1,32,243,1024,3125,7776,16807,32768,59049]

def main
  max = GOJO[9]*max_n
  puts (2..max).select{|i|
    i == gojo_wa(i)
  }.inject(:+)
end

#探索する桁数の最大値
def max_n()
  n = 2
  while 10**(n-1) <= GOJO[9]*n
    n += 1
  end
  n
end

#5乗和を求める
def gojo_wa(n)
  n.to_s.split("").map{|s| GOJO[s.to_i]}.inject(:+)
end

main

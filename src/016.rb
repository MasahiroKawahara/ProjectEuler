# -*- coding: utf-8 -*-
# 2^15 = 32768 であり, これの数字和 ( 各桁の和 ) は 3 + 2 + 7 + 6 + 8 = 26 となる.

# 同様にして, 2^1000 の数字和を求めよ.

puts (2**1000).to_s.split("").map{|s| s.to_i}.inject(:+)
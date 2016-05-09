# -*- coding: utf-8 -*-
# n × (n - 1) × ... × 3 × 2 × 1 を n! と表す.

# 例えば, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800 となる.
# この数の各桁の合計は 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27 である.

# では, 100! の各桁の数字の和を求めよ.

puts (1..100).inject(:*).to_s.split("").map{|s| s.to_i}.inject(:+)

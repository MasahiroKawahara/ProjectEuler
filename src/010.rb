# -*- coding: utf-8 -*-
# 10以下の素数の和は 2 + 3 + 5 + 7 = 17 である.

# 200万以下の全ての素数の和を求めよ.

require 'prime'

BOUND = 2000000

puts Prime.each(BOUND).inject(:+)

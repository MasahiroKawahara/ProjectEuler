# -*- coding: utf-8 -*-
# 正の整数に以下の式で繰り返し生成する数列を定義する.

# n → n/2 (n が偶数)
# n → 3n + 1 (n が奇数)

# 13からはじめるとこの数列は以下のようになる.

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# 13から1まで10個の項になる. この数列はどのような数字からはじめても最終的には 1 になると考えられているが, まだそのことは証明されていない(コラッツ問題)

# さて, 100万未満の数字の中でどの数字からはじめれば最長の数列を生成するか.
# 注意: 数列の途中で100万以上になってもよい

MAX = 1000000
$COLLATS_LEN = {}

def main
  (2..MAX).each{|n| $COLLATS_LEN[n] = get_collats_len(n) }
  puts $COLLATS_LEN.max_by{|k,v| v}
end

def get_collats_len(n)
  if n == 1
    1
  else
    nn = n%2 == 0 ? n/2 : 3*n+1
    if $COLLATS_LEN[nn] != nil
      1 + $COLLATS_LEN[nn]
    else
      1 + get_collats_len(nn)
    end
  end
end

main

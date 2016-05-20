# -*- coding: utf-8 -*-
# 5は数の和として6通りに書くことができる:

# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1

# 2つ以上の正整数の和としての100の表し方は何通りか.

#http://www.asahi-net.or.jp/~KC2H-MSM/excel/excel003.htm より...
#################
# 自然数ｎの分割数を p(n) で表す。
# また、上のように、自然数ｎをｒ個に分けた時の分け方の個数を、p(n,r) で表す。

# 上より明らかに、

# p(n) = \sum_{i=1..n} p(n,i)
# である。

# p(n,r) には、以下の関係式が成り立つ。

# p(n,1)＝１
# p(n,n)＝１
# p(n,r)＝p(n-r,r)＋p(n-1,r-1)

# ただし、ｎ＜ｒのとき、p(n,r)＝０と定義する。
#################

NUM = 100

$summations = Hash.new {|h,k| h[k] = {}} #p[n][r] = p(n,r)

def main
  (1..NUM).each{|n|
    (1..n).each{|r|
      $summations[n][r] = p(n,r)
    }
  }
  puts get_summations(NUM)
end

def get_summations(n)
  (1..n).map{|i| $summations[n][i]}.inject(:+) - 1
end

def p(n,r)
  if n < r
    0
  else
    case r
    when 1,n
      1
    else
      pp(n-r,r) + pp(n-1,r-1)
    end
  end
end

def pp(n,r)
  if $summations[n][r] != nil
    $summations[n][r]
  else
    p(n,r)
  end
end

main

# -*- coding: utf-8 -*-
# nとdを正の整数として, 分数 n/d を考えよう. n<d かつ HCF(n,d)=1 のとき, 真既約分数と呼ぶ.

# d ≤ 8について既約分数を大きさ順に並べると, 以下を得る:

# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
# 3/7のすぐ左の分数は2/5である.

# d ≤ 1,000,000について真既約分数を大きさ順に並べたとき, 3/7のすぐ左の分数の分子を求めよ.

D_MAX = 1000000

def main
  puts (3..D_MAX).map{|d| get_nearest_simple_frac(d)}.max.numerator
end

#3/7 に最も近い既約分数n/d (n/d < 3/7)を返す．
def get_nearest_simple_frac(d)
  n = d%7 == 0 ? d*3/7 - 1 : d*3/7
  while gcd(d,n) != 1
    n -= 1
  end
  Rational(n,d)
end

#最大公約数を求める(m >= n) 
def gcd(m,n)
  if n == 0
    m
  else
    gcd(n,m%n)
  end
end

main

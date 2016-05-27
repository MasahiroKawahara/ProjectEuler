# -*- coding: utf-8 -*-
# nとdを正の整数として, 分数 n/d を考えよう. n<d かつ HCF(n,d)=1 のとき, 真既約分数と呼ぶ.

# d ≤ 8 について既約分数を大きさ順に並べると, 以下を得る:

# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
# 1/3と1/2の間には3つの分数が存在することが分かる.

# では, d ≤ 12,000 について真既約分数をソートした集合では, 1/3 と 1/2 の間に何個の分数があるか?

D_MAX = 12_000

def main
  puts (4..D_MAX).map{|d| sum_of_simple_frac(d)}.inject(:+)
end

#1/3 と 1/2 の間に存在する既約分数XX/d の個数を求める
def sum_of_simple_frac(d)
  count = 0
  n_min = d/3 + 1
  n_max = d/2
  (n_min..n_max).each{|n|
    if gcd(d,n) == 1
      count += 1
    end    
  }
  count
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

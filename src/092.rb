# -*- coding: utf-8 -*-
# 各桁の2乗を足し合わせて新たな数を作ることを, 同じ数が現れるまで繰り返す.

# 例えば

# 　　44 → 32 → 13 → 10 → 1 → 1
# 　　85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

# のような列である. どちらも1か89で無限ループに陥っている. 
# 驚くことに, どの数から始めても最終的に1か89に到達する.

# では, 10,000,000より小さい数で89に到達する数はいくつあるか.

SQ = [0,1,4,9,16,25,36,49,64,81]

BOUND = 10000000 - 1
SUM_MAX = SQ[9] * BOUND.to_s.size #BOUNDの2乗和の取りうる値の最大値

N_BOUND = 100000 - 1
N_SUM_MAX = SQ[9] * N_BOUND.to_s.size #N_BOUNDの2乗和の取りうる値の最大値

def main
  count = 0
  #ハッシュ(値 P(0..SUM_MAX)  =>  P が89に到達する？)
  h_can_arrive89 = get_hash_1(SUM_MAX)
  #ハッシュ(数字ABXXXXX のAB以外の数字XXXXXの2乗和Q (0..N_SUM_MAX) => SQ[A]+SQ[B]+Q_SUM (1..SUM_MAX) が89に収束するような数ABの個数) 
  h_num_arrive89 = get_hash_2(N_SUM_MAX, h_can_arrive89)
  #5桁以下の数字XXXXXについて，数字ABXXXXX が89に収束するような数字AB の個数をcount に加算
  (0..N_BOUND).each{|x|
    q = sum_digit_square(x)
    count += h_num_arrive89[q]
  }
  puts count
end

def get_hash_1(bound)
  h = {}
  (0..bound).each{|n|
    h[n] = arrive_at_89?(n)
  }
  h
end

def get_hash_2(bound, hash1)
  h = {}
  (0..bound).each{|q|
    h[q] = (0..99).count{|i| hash1[sum_digit_square(i) + q]}
  }
  h
end

def arrive_at_89?(n)
  case n
  when 89
    true
  when 0,1
    false
  else
    nn = sum_digit_square(n)
    arrive_at_89?(nn)
  end
end

def sum_digit_square(n)
  n.to_s.split("").map{|s| SQ[s.to_i]}.inject(:+)
end

main

# -*- coding: utf-8 -*-
# 145は各桁の階乗の和が145と自分自身に一致することで有名である.

# 1! + 4! + 5! = 1 + 24 + 120 = 145

# 169の性質はあまり知られていない. これは169に戻る数の中で最長の列を成す. このように他の数を経て自分自身に戻るループは3つしか存在しない.

# 169 → 363601 → 1454 → 169
# 871 → 45361 → 871
# 872 → 45362 → 872

# どのような数からスタートしてもループに入ることが示せる.

# 例を見てみよう.

# 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
# 78 → 45360 → 871 → 45361 (→ 871)
# 540 → 145 (→ 145)

# 69から始めた場合, 列は5つの循環しない項を持つ. また100万未満の数から始めた場合最長の循環しない項は60個であることが知られている.

# 100万未満の数から開始する列の中で, 60個の循環しない項を持つものはいくつあるか?

FC = [1,1,2,6,24,120,720,5040,40320,362880] #FC[i] = i!を表す

MAX = 999_999

$chains = {
  145 => 1,
  169 => 3,
  363601 => 3,
  1454 => 3,
  871 => 2,
  45361 => 2,
  872 => 2,
  45362 => 2
} #ハッシュ( n => nからのループする直前までの連鎖の数 )

def main
  puts (1..MAX).count{|n| num_chains([n]) == 60 }
end

# list.first から始まる階乗和列の長さを求める
def num_chains(list)
  n = list.last
  if $chains[n] != nil
    num = list.size - 1
    #例えば A,B,C,N で $chains[N] = X の時，
    # $chains[A] = 3 + X
    # $chains[B] = 2 + X
    # $chains[C] = 1 + X
    num.times{|i|
      $chains[list[i]] = (num - i) + $chains[n]
    }
    num + $chains[n]
  else
    nn = sum_facts_of_digit(n)
    if nn == n
      $chains[nn] = 1
      num_chains(list)
    else
      num_chains(list+[nn])      
    end
  end
end

def sum_facts_of_digit(n)
  n.to_s.split("").map{|s| FC[s.to_i]}.inject(:+)
end

main

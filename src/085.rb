# -*- coding: utf-8 -*-
# 注意深く数えると, 横が3, 縦が2の長方形の格子には, 18個の長方形が含まれている.

# p_085.gif

# ぴったり2,000,000個の長方形を含むような長方形の格子は存在しない. 一番近い解を持つような格子の面積を求めよ.


# M*N の格子グラフに含まれる長方形の数は (1/4)M(M+1)N(N+1)
# M(M+1)N(N+1) が8,000,000 に最も近くなるM,N を求める．

NUM = 8_000_000

BOUND = Math.sqrt(NUM).to_i

def main
  s = (1..BOUND).map{|m| find_nearest_area(m)}.min_by{|area, count| (NUM - count).abs}[0]
  puts s
end

#返り値 m(m+1)n(n+1) が8,000,000 に最も近くなる時の [m*n, m(m+1)n(n+1)]
def find_nearest_area(m)
  mm1 = m*(m+1)
  n = Math.sqrt(NUM/mm1).to_i
  opt_n = n
  count = mm1*n*(n+1)
  inc_flag = count < NUM
  while true
    n += inc_flag ? 1 : -1
    t_count = mm1*n*(n+1)
    if (NUM - t_count).abs < (NUM - count).abs
      opt_n = n
      count = t_count
    end
    if (t_count < NUM) ^ inc_flag
      break
    end
  end
  [m*opt_n, count]
end
main


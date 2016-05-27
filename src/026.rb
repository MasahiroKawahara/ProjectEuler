# -*- coding: utf-8 -*-
# 単位分数とは分子が1の分数である. 分母が2から10の単位分数を10進数で表記すると次のようになる.

# 1/2 = 0.5
# 1/3 = 0.(3)
# 1/4 = 0.25
# 1/5 = 0.2
# 1/6 = 0.1(6)
# 1/7 = 0.(142857)
# 1/8 = 0.125
# 1/9 = 0.(1)
# 1/10 = 0.1

# 0.1(6)は 0.166666... という数字であり, 1桁の循環節を持つ. 1/7 の循環節は6桁ある.

# d < 1000 なる 1/d の中で小数部の循環節が最も長くなるような d を求めよ.

MAX = 1000

def main
  puts (2..MAX).max_by{|d| recurring_cycle_length(d,[1]) }
end

#1/d の循環節の長さを求める
def recurring_cycle_length(d, list)
  remain = 10 * list.last % d
  if remain == 0
    0
  elsif list.include?(remain)
    list[list.index(remain)..-1].size
  else
    recurring_cycle_length(d, list+[remain])
  end
end

main

# -*- coding: utf-8 -*-
# 各桁の2乗を足し合わせて新たな数を作ることを, 同じ数が現れるまで繰り返す.

# 例えば

# 　　44 → 32 → 13 → 10 → 1 → 1
# 　　85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

# のような列である. どちらも1か89で無限ループに陥っている. 
# 驚くことに, どの数から始めても最終的に1か89に到達する.

# では, 10,000,000より小さい数で89に到達する数はいくつあるか.



SQ = {
  0 => 0 , 
  1 => 1 , 
  2 => 4 , 
  3 => 9 , 
  4 => 16, 
  5 => 25, 
  6 => 36, 
  7 => 49, 
  8 => 64, 
  9 => 81
}
BOUND = 10000000

$digits_2_bool = {}
$list_89 = [] #89に到達する数字のリスト
MAX = 300 #リストに格納しておく数字の最大値
# 0,000,000
# 9 999 999
def main
  i = 0
  (1...BOUND).each{|n| "#{n/1000 + n%1000}"}
  puts i
  # l = []
  # count = 0
  # (1...BOUND).each{|n|
  #   l << to_digits(n).join("")
  #   if arrive_at_89?(n)
  #     count += 1
  #   end
  # }
  # l.uniq.each{|n|
  #   puts n
  # }
  # puts count
end

def arrive_at_89?(n)
  case n
  when 89
    if n <= MAX
      $list_89 << n
    end
    true
  when 1
    false
  else
    nn = n.to_s.split("").map{|s| SQ[s.to_i]}.inject(:+)
    if $list_89.include?(nn)
      true
    else
      arrive_at_89?(nn)
    end
  end
end

def to_digits(n)
  n.to_s.split("").map{|s| s.to_i}.select{|i| i!=0}.sort
end

main

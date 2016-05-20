# -*- coding: utf-8 -*-
# 5は数の和として6通りに書くことができる:

# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1

# 2つ以上の正整数の和としての100の表し方は何通りか.

$summations = {}

NUM = 60

def main
  (1..NUM).each{|n|
    p n
    $summations[n] = count_of_summations(n,n)
  }
  #puts count_of_summations(NUM, NUM)
  puts $summations[NUM]
end

#m以下の数字を使って，整数和s を表す方法が何通りあるのか．
def count_of_summations(m, s)
  if m == s && $summations[m] != nil
    $summations[m]
  elsif m == 0
    0
  elsif m == 1
    1
  else
    (1..m).map{|i|
      count_of_summations([i,s-i].min, s-i)
    }.inject(:+)
  end
end

main

# -*- coding: utf-8 -*-
#二乗すると「1_2_3_4_5_6_7_8_9_0」の形となるような唯一の正整数を求めよ. ただし, 「_」は1桁の数である.

# * 解をXをする．Xの末尾は0．
#2乗して "1A2B3C4 _5_6_7_8_9" になるX'をもとめる
#X = X'*10

def main
  (0..999).each{|a| #a = ABC
    if search_concealed_sqrt(a)
      break
    end
  }
end

def search_concealed_sqrt(a)
  flag = false
  aa = ("000"+a.to_s)[-3..-1]
  lb = Math.sqrt("1#{aa[0]}2#{aa[1]}3#{aa[2]}40000000000".to_i).to_i
  ub = Math.sqrt("1#{aa[0]}2#{aa[1]}3#{aa[2]}50000000000".to_i).to_i
  (lb..ub).each{|x|
    xx = x**2
    if is_the_concealed_square(xx)
      puts x*10
      flag = true
      break
    end
  }
  flag
end

#n が1_2_3_4_5_6_7_8_9 であるかどうか
def is_the_concealed_square(n)
  s = n.to_s
  (1..9).all?{|i| s[i*2-2] == i.to_s}
end

main

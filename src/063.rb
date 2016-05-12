# -*- coding: utf-8 -*-
# 5桁の数 16807 = 75は自然数を5乗した数である. 同様に9桁の数 134217728 = 89も自然数を9乗した数である.

# 自然数を n 乗して得られる n 桁の正整数は何個あるか?

#### 考え方
# 10以上の自然数i については，必ず (i^n の桁数) > n となるので，探索対象外．
# 1から9 までの自然数i について，(i^n の桁数) < n となると，n+1以降もこの不等式が成り立つ
# (このnが見つかり次第，n+1以降は調べる必要が無い)．

def main
  count = 0
  (1..9).each{|i|
    n = 0
    p = 1 #i^n を表す
    while true
      p = p * i 
      n += 1
      p_digits = num_digits(p)
      if p_digits == n
        count += 1
      elsif p_digits < n
        break
      end
    end
  }
  puts count
end

def num_digits(p)
  p.to_s.size
end

main

# -*- coding: utf-8 -*-
# 素数を小さい方から6つ並べると 2, 3, 5, 7, 11, 13 であり, 6番目の素数は 13 である.
# 10 001 番目の素数を求めよ.

require 'prime'

puts Prime.each.take(10001).last

#以下，prime モジュールを使わずに書いたコード(遅い)

def main
  n = 3
  index = 2
  while index < 10001
    n += 2
    if isPrime(n)
      index += 1
    end
  end
  puts n
end

def isPrime(n) #自然数の素数判定を行う
  case n
  when 1
    false
  when 2,3,5
    true
  else
    if n%2 == 0 #偶数は素数でない
      false
    else #奇数の場合
      nl = n.to_s.split("").map{|s| s.to_i} #各桁のリスト作成 (例: 1234 => [1,2,3,4])
      if nl.inject(:+)%3 == 0 || nl.last == 0 || nl.last == 5 #3の倍数， 5の倍数の判定
        false
      else
        primeFlag = true
        (7..Math.sqrt(n).to_i).step(2).each{|div| #7からnの平方根までの奇数でnを割る
          if div%3 == 0 || div%5 == 0 #3の倍数，5の倍数で割らない
            next
          else
            if n%div == 0 #div で割り切れたら素数でない
              primeFlag = false
              break
            end
          end
        }
        primeFlag
      end
    end
  end
end

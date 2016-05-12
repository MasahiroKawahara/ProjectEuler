# -*- coding: utf-8 -*-
# 素数3, 7, 109, 673は非凡な性質を持っている. 任意の2つの素数を任意の順で繋げると, また素数になっている. 例えば, 7と109を用いると, 7109と1097の両方が素数である. これら4つの素数の和は792である. これは, このような性質をもつ4つの素数の集合の和の中で最小である.

# 任意の2つの素数を繋げたときに別の素数が生成される, 5つの素数の集合の和の中で最小のものを求めよ.

#未完成

require 'prime'

MAX_PRIME = 999
PRIMES = Prime.each(999999).to_a

def main
  primes_1 = [3] #3 と桁の和が3の倍数+1
  primes_2 = [3] #3 と桁の和が3の倍数+2 (2,5を除く)
  Prime.each(MAX_PRIME).each{|p|
    if sum_digit(p)%3 == 1
      primes_1 << p
    elsif sum_digit(p)%3 == 2 && p != 5  && p != 2
      primes_2 << p
    end
  }
  
  pairs_1 = {}
  primes_1.combination(2){|m,n|
    if prime_pair?(m,n)
      if pairs_1[m] != nil then pairs_1[m] << n end
      if pairs_1[n] != nil then pairs_1[n] << m end
      if pairs_1[m] == nil then pairs_1[m] = [n] end
      if pairs_1[n] == nil then pairs_1[n] = [m] end
    end
  }
  primes_1.each{|p|
    puts "#{p} => #{pairs_1[p]}"
  }
end

def sum_digit(n)
  n.to_s.split("").map{|s| s.to_i}.inject(:+)
end

def prime_pair?(m,n)
  Prime.prime?("#{m}#{n}".to_i) && Prime.prime?("#{n}#{m}".to_i)
  #PRIMES.include?("#{m}#{n}".to_i) && PRIMES.include?("#{n}#{m}".to_i)
end

main

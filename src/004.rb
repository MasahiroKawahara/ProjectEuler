# -*- coding: utf-8 -*-
# 左右どちらから読んでも同じ値になる数を回文数という. 2桁の数の積で表される回文数のうち, 最大のものは 9009 = 91 × 99 である.
# では, 3桁の数の積で表される回文数の最大値を求めよ.

def main()
  maxM = 0
  maxN = 0
  maxP = 0

  (100..999).each{|m|
    (m..999).each{|n|
      p = m*n
      if p > maxP && isPalindrome(p)
        maxM, maxN, maxP = m, n, p
      end
    }
  }

  puts maxP
end

def isPalindrome(num)
  ns = num.to_s
  ns == ns.reverse
end

main

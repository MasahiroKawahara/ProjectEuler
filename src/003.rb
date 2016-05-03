# -*- coding: utf-8 -*-
# 13195 の素因数は 5, 7, 13, 29 である.
# 600851475143 の素因数のうち最大のものを求めよ.

n = 600851475143
div = 3
facts = []

while n > 1
  if n%div == 0
    n /= div
    facts << div
  else
    div += 2
  end
end

puts facts.max

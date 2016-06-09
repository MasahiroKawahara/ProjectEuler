# -*- coding: utf-8 -*-
# 2 ≤ a ≤ 5 と 2 ≤ b ≤ 5について, a^b を全て考えてみよう:

# 2^2=4, 2^3=8, 2^4=16, 2^5=32
# 3^2=9, 3^3=27, 3^4=81, 3^5=243
# 4^2=16, 4^3=64, 4^4=256, 4^5=1024
# 5^2=25, 5^3=125, 5^4=625, 5^5=3125
# これらを小さい順に並べ, 同じ数を除いたとすると, 15個の項を得る:

# 4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125

# 2 ≤ a ≤ 100, 2 ≤ b ≤ 100 で同じことをしたときいくつの異なる項が存在するか?

def main
  list = []
  (2..100).each do |a|
    (2..100).each do |b|
      list << a**b
    end
  end
  puts list.uniq.size
end

main

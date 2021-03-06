# -*- coding: utf-8 -*-
# 2520 は 1 から 10 の数字の全ての整数で割り切れる数字であり, そのような数字の中では最小の値である.
# では, 1 から 20 までの整数全てで割り切れる数字の中で最小の正の数はいくらになるか.

#素数である
#2  => 2  
#3  => 3  
#5  => 5  
#7  => 7  
#11 => 11
#13 => 13
#17 => 17
#19 => 19

#素数でない
#4  => 2*2   ... 16  で割り切れるなら，割り切れる
#6  => 2*3   ... 2,3 で割り切れるなら，割り切れる
#8  => 2*2*2 ... 16  で割り切れるなら，割り切れる
#9  => 3*3   ... 18  で割り切れるなら，割り切れる
#10 => 2*5   ... 2,5 で割り切れるなら，割り切れる
#12 => 2*2*3 ... 3,16で割り切れるなら，割り切れる
#14 => 2*7   ... 2,7 で割り切れるなら，割り切れる
#15 => 3*5   ... 3,5 で割り切れるなら，割り切れる
#20 => 2*2*5 ... 5,16で割り切れるなら，割り切れる

#16 => 2*2*2*2 ... 2*   (2*2*2)
#18 => 2*3*3   ... 2*3* (3)

# 16は素数の2 を1回，それに加えて素数の2 を3回掛ける必要がある
# 18は素数の2と3 を1回ずつ，それに加えて素数の3 を1回掛ける必要がある

#よって，答えは 2*3*5*7*11*13*17*19*(2*2*2)*(3)

puts 2*3*5*7*11*13*17*19*(2*2*2)*(3)

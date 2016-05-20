# -*- coding: utf-8 -*-
# 2の平方根は無限連分数として書くことができる.

# 式.jpg

# 無限連分数である √2 = [1;(2)] と書くことができるが, (2) は2が無限に繰り返されることを示す. 同様に, √23 = [4;(1,3,1,8)].

# 平方根の部分的な連分数の数列から良い有理近似が得られることが分かる.√2の近似分数について考えよう.

# 式2.jpg

# 従って, √2の近似分数からなる数列の最初の10項は：

# 1, 3/2, 7/5, 17/12, 41/29, 99/70, 239/169, 577/408, 1393/985, 3363/2378, ...

# もっとも驚くべきことに, 数学的に重要な定数,
# e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].

# e の近似分数からなる数列の最初の10項は：

# 2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...

# 10項目の近似分数の分子の桁を合計すると1+4+5+7=17である.

# e についての連分数である近似分数の100項目の分子の桁の合計を求めよ.

INDEX = 100

def main
  el = [2] + (1..INDEX/2).map{|k| [1,k*2,1]}.flatten[0...INDEX-1] #[2,1,2,1,1,4,1,...] ([2; 1,2,1, 1,4,1, ...] を表す)
  e_flac = continued_frac(el[0], el[1...INDEX-1], Rational(1,el[-1]))
  puts e_flac.numerator.to_s.split("").map{|s| s.to_i}.inject(:+)
end

#連分数 [f; ns+[k]]を求める．(ns+[k] ... l が1/k で表せるとき)
def continued_frac(f, ns, l)
  if ns.empty?
    f + l
  else
    continued_frac(f, ns[0..-2], Rational(1,ns[-1]+l))
  end
end

main

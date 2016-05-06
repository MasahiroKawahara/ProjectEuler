# -*- coding: utf-8 -*-
# 2×2 のマス目の左上からスタートした場合, 引き返しなしで右下にいくルートは 6 つある.
# では, 20×20 のマス目ではいくつのルートがあるか.

def main
  puts num_paths(20,20)
end

# m 回下に進み，n 回右に進む．
# => m 個の"下"と，n 個の"右"からなる順列の個数を求めれば良い．
def num_paths(m,n)
  puts comb(m+n,n)
end

def comb(n,r)
  case r
  when 0,n
    1
  else
    (n-r+1..n).inject(:*)/(1..r).inject(:*)
  end
end

main

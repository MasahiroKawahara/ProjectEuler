# -*- coding: utf-8 -*-
# イギリスでは硬貨はポンド£とペンスpがあり，一般的に流通している硬貨は以下の8種類である.

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

# 以下の方法で£2を作ることが可能である．

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

# これらの硬貨を使って£2を作る方法は何通りあるか?

$count = 0

def main
  pass(200,[200,100,50,20,10,5,2,1])
  puts $count
end

def pass(remain,ms)
  if ms.any?
    m = ms.first
    (0..remain/m).each do |i|
      n_remain = remain - m*i
      if n_remain <= 0
        $count += 1
      else
        pass(n_remain, ms.drop(1))
      end
    end
  end
end

main

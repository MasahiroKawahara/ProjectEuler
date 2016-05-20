# -*- coding: utf-8 -*-
# 立方数 41063625 (3453) は, 桁の順番を入れ替えると2つの立方数になる: 56623104 (3843) と 66430125 (4053) である. 41063625は, 立方数になるような桁の置換をちょうど3つもつ最小の立方数である.

# 立方数になるような桁の置換をちょうど5つもつ最小の立方数を求めよ


# $cubic[n][s] = 立方数を格納するハッシュ (ただし，これら立方数の桁数はn ， 各桁の和はs)
$cubic = Hash.new {|h,k| h[k] = {}}

BOUND = 10000 #探索する最大のBOUND^3

def main
  # $cubic の作成
  (1..BOUND).each{|i|
    n = i**3
    nd, sd = num_digits(n), sum_digits(n)
    if $cubic[nd][sd] == nil
      $cubic[nd][sd] = [n]
    else
      $cubic[nd][sd] = $cubic[nd][sd] + [n]
    end
  }
  # 立方数の置換の走査
  permutations = []
  $cubic.each{|n,h|
    h.each{|s,l|
      p = find_5_permutations(l)
      if p != nil
        permutations << p
      end
    }
  }
  puts permutations.map{|l| l.min}.min
end

def find_5_permutations(nl)
  if nl.size < 5
    nil
  else
    sll = nl.map{|n| n.to_s.split("")} # ex) nl:[123,456,321] => sll:[["1","2","3"],["4","5","6"],["3","2","1"]]
    sl_sort = sll.map{|l| l.sort.join}.sort # ex) sll:[["1","2","3"],["4","5","6"],["3","2","1"]] => sl_sort:["123","123","456"]
    str = get_5_overlap_string(sl_sort)
    if str != nil
      sll.select{|l| l.sort.join == str}.map{|l| l.join.to_i}
    else
      nil
    end
  end
end

def get_5_overlap_string(sl_sort)
  str = nil
  lap = 1
  (sl_sort.size - 1).times{|i|
    if sl_sort[i] == sl_sort[i+1]
      lap += 1
    else
      if lap == 5
        str = sl_sort[i]
      end
      lap = 1
    end
  }
  str
end

def num_digits(n)
  n.to_s.size
end

def sum_digits(n)
  n.to_s.split("").map{|s| s.to_i}.inject(:+)
end

main

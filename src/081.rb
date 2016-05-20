# -*- coding: utf-8 -*-
# 下記の5次の正方行列で, 左上のセルから開始し右下のセルで終わるパスを探索する. ただし下方向と右方向にのみ移動できるものとする. 
# 通過したセルの和が最小となるパスは* 字で示されたもので, その値は2427である.

# *131	673	234	103	18
# *201	*96	*342	965	150
# 630	803	*746	*422	111
# 537	699	497	*121	956
# 805	732	524	*37	*331
# 今, 31Kのテキストファイルmatrix.txt (右クリックして, 『名前をつけてリンク先を保存』)には80×80の行列が書かれている. 
# 同様に左上のセルから開始し右下のセルで終わり, かつ右方向と下方向にのみ移動するときの最小のパスの和を求めよ.

# Q18(018.rb)をベースに作成

#$rhombus は，例えばこういう行列を，こういう風に格納するリスト
# [[0,1,2],
#  [3,4,5],
#  [6,7,8]]
# =>
#  [[0],
#  [3,1],
# [6,4,2],
#  [7,5],
#   [8]]
$rhombus = []

def main
  parse(ARGV[0])
  nth_min_distances = []
  $rhombus.size.times{|n|
    if n == 0
      nth_min_distances = $rhombus[0]
    else
      nth_min_distances = get_next_min_distances(n, nth_min_distances)
    end
  }
  puts nth_min_distances.min
end

#n 段目の最小距離のリストを返す
def get_next_min_distances(n, min_distances)
  (0...$rhombus[n].size).map{|i|
    get_ups(i, $rhombus[n], min_distances).min + $rhombus[n][i]
  }
end

#上の要素2つ(もしくは1つ)を取得する
def get_ups(i, down, up)
  if down.size >= up.size #$rhombus の上半分
    case i
    when 0
      [up[0]]
    when down.size - 1
      [up[-1]]
    else
      [up[i-1],up[i]]
    end
  else #$rhombus の下半分
    [up[i], up[i+1]]
  end
end

#$rhombus を正方行列を，右斜め上方向にスライスしたときに得られる数リスト群とする
def parse(f)
  matrix = []
  File.foreach(f){|l|
    matrix << l.split(",").map{|s| s.to_i}
  }
  size = matrix.size
  size.times{|i|
    size.times{|j|
      if i == 0 || j == size - 1
        $rhombus << [matrix[i][j]]
      else
        $rhombus[i+j] = [matrix[i][j]] + $rhombus[i+j]
      end
    }
  }
end

main

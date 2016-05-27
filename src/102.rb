# -*- coding: utf-8 -*-
# 3つの異なる点が -1000 ≤ x, y ≤ 1000 かつ三角形となるように, デカルト平面上にランダムに与えられる.

# 以下の2つの三角形を考える.

# A(-340,495), B(-153,-910), C(835,-947)
# X(-175,41), Y(-421,-714), Z(574,-645)
# 三角形ABCが原点を内部に含み, XYZは原点を内部に含まないことが確かめられる.

# 27Kのテキストファイルtriangles.txt(右クリックしリンク先を保存して欲しい) にランダムな1000個の三角形が適当なフォーマットのもと含まれている. 内部に原点を含む三角形の数を答えよ.

# 注: ファイル中の最初の二つは三角形ABC, XYZである.

def main
  triangles = parse(ARGV[0])
  puts triangles.count{|t| origin_include?(t) }
end

#triangle の内部に原点を含むかどうか
def origin_include?(triangle) 
  r_side = triangle.select{|p| p[0] >= 0} #右側，つまり x >= 0 の領域に含まれる点
  l_side = triangle.select{|p| p[0] <  0} #左側，つまり x <  0 の領域に含まれる点
  case [l_side.size, r_side.size]
  when [0,3]
    x0_points = r_side.select{|p| p[0] == 0}
    if x0_points.size != 2
      false
    else
      ys = x0_points.map{|p| p[1]}
      0.between?(ys.min, ys.max)
    end
  when [1,2],[2,1]
    p  = [r_side, l_side].min_by{|l| l.size}.first
    qs = [r_side, l_side].max_by{|l| l.size}
    ys = [get_y_intercept(p, qs[0]), get_y_intercept(p, qs[1])]
    0.between?(ys.min, ys.max)
  when [3,0]
    false
  end
end

#p1,p2 を結ぶ直線のy切片を求める
def get_y_intercept(p1,p2)
  (p2[0]*p1[1] - p2[1]*p1[0])/(p2[0] - p1[0]).to_f
end

def parse(f)
  tl = []
  File.foreach(f){|l|
    t = l.split(",").map{|s| s.to_i}
    tl << [[t[0],t[1]],[t[2],t[3]],[t[4],t[5]]]
  }
  tl
end

main

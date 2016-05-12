# -*- coding: utf-8 -*-
# オンラインバンクで通常使われるsecurity methodは, パスコードからランダムに選んだ3文字をユーザーに要求するものである.

# たとえば, パスコードが531278のとき, 2番目, 3番目, 5番目の文字を要求されるかもしれない. このとき, 期待される答えは: 317 である.

# テキストファイルkeylog.txtには, ログインに成功した50回の試行が記録されている.

# 3つの文字が常に順番通りに要求されるとするとき, ファイルを分析して, 可能なパスコードのなかでもっとも短いものを見つけよ.

def main
  keys = parse(ARGV[0])
  puts analyze_shortest_passcode(keys)
end

def analyze_shortest_passcode(keys)
  #重複を無くす
  keys.uniq!
  #「パスコード中の数字列について，数字m の後ろに必ず数字n が存在する」規則を m -> n と表す．
  #rulesの各要素[m,n]は「m -> n」であることを表す．
  rules = []
  keys.each{|k| rules += [[k[0],k[1]],[k[1],k[2]]] }
  rules.uniq!
  #求めるパスコード列を L + R とする(L,Rはリスト)
  left_code = [] #L
  right_code = [] #R
  while rules.any?
    ms = rules.map{|l| l[0]} #rulesの各要素[m,n] について，m の集合
    ns = rules.map{|l| l[1]} #rulesの各要素[m,n] について，n の集合
    ms_only_nums = (ms - ns).uniq 
    ns_only_nums = (ns - ms).uniq
    left_code  = left_code + ms_only_nums # 規則「m -> n」について，mにしか存在しない数字は 左詰めにする．
    right_code = ns_only_nums + right_code # 規則「m -> n」について，nにしか存在しない数字は 右詰めにする．
    #現状のleft_code + right_code のパスコードで満たされる規則は除外する．
    rules.select!{|l| !ms_only_nums.include?(l[0])} 
    rules.select!{|l| !ns_only_nums.include?(l[1])}
  end
  (left_code + right_code).join("")
end

def parse(file)
  list = []
  File.foreach(ARGV[0]){|l|
    list << l
  }
  list
end

main

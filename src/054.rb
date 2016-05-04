# -*- coding: utf-8 -*-
# カードゲームのポーカーでは, 手札は5枚のカードからなりランク付けされている. 役を低い方から高い方へ順に並べると以下である.

# 役無し(ハイカード): 一番値が大きいカード
# ワン・ペア: 同じ値のカードが2枚
# ツー・ペア: 2つの異なる値のペア
# スリーカード: 同じ値のカードが3枚
# ストレート: 5枚の連続する値のカード
# フラッシュ: 全てのカードが同じスート (注: スートとはダイヤ・ハート・クラブ/スペードというカードの絵柄のこと)
# フルハウス: スリーカードとペア
# フォーカード: 同じ値のカードが4枚
# ストレートフラッシュ: ストレートかつフラッシュ
# ロイヤルフラッシュ: 同じスートの10, J, Q, K, A
# ここでカードの値は小さい方から2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, Aである. (訳注：データ中で10は'T'と表される)

# もし2人のプレイヤーが同じ役の場合には, 役を構成する中で値が最も大きいカードによってランクが決まる: 例えば, 8のペアは5のペアより強い . それでも同じランクの場合には (例えば, 両者ともQのペアの場合), 一番値が大きいカードによってランクが決まる . 一番値が大きいカードが同じ場合には, 次に値が大きいカードが比べれられ, 以下同様にランクを決定する.

# poker.txt(https://projecteuler.net/project/resources/p054_poker.txt)には1000個のランダムな手札の組が含まれている. 各行は10枚のカードからなる (スペースで区切られている): 最初の5枚がプレイヤー1の手札であり, 残りの5枚がプレイヤー2の手札である. 以下のことを仮定してよい

# 全ての手札は正しい (使われない文字が出現しない. 同じカードは繰り返されない)
# 各プレイヤーの手札は特に決まった順に並んでいるわけではない
# 各勝負で勝敗は必ず決まる
# 1000回中プレイヤー1が勝つのは何回か? (訳注 : この問題に置いてA 2 3 4 5というストレートは考えなくてもよい)

def main
  p1_wincount = 0
  File.foreach(ARGV[0]){|l|
    str_l = l.split
    p1_cards = str_l[0..Hand::NUM_CARDS-1].map{|s| Card.new(s[0],s[1])}
    p2_cards = str_l[Hand::NUM_CARDS..-1] .map{|s| Card.new(s[0],s[1])}

    p1_hand = Hand.judge_hand(p1_cards)
    p2_hand = Hand.judge_hand(p2_cards)
    #役で勝っている場合
    if p1_hand.hand > p2_hand.hand
      p1_wincount += 1
      #役が同じで，役の値で勝っている場合
    elsif p1_hand.hand == p2_hand.hand && p1_hand.max_rank > p2_hand.max_rank
      p1_wincount += 1
      #役も，役の値も同じ場合
    elsif p1_hand.hand == p2_hand.hand && p1_hand.max_rank == p2_hand.max_rank
      p1_ranks = p1_cards.map{|c| c.rank}.sort.reverse
      p2_ranks = p2_cards.map{|c| c.rank}.sort.reverse
      Hand::NUM_CARDS.times{|i|
        if p1_ranks[i] > p2_ranks[i]
          p1_wincount += 1
          break
        elsif p1_ranks[i] < p2_ranks[i]
          break
        end
      }
    end
  }
  p p1_wincount
end

#カードクラス
class Card
  attr_reader :rank, :suit
  def initialize(r, s)
    @rank = Card.char2rank(r)
    @suit = s
  end
  def self.char2rank(rc)
    case rc
    when "T" then 10
    when "J" then 11
    when "Q" then 12
    when "K" then 13
    when "A" then 14
    else rc.to_i
    end
  end
end

#役クラス
class Hand
  NUM_CARDS = 5 #カードの枚数
  HC = 0 #役なし
  OP = 1 #ワン・ペア
  TP = 2 #ツー・ペア
  TK = 3 #スリーカード
  ST = 4 #ストレート
  FL = 5 #フラッシュ
  FH = 6 #フルハウス
  FK = 7 #フォーカード
  SF = 8 #ストレートフラッシュ
  RF = 9 #ロイヤルフラッシュ
  attr_reader :hand, :max_rank
  def initialize(h, r)
    @hand = h
    @max_rank = r
  end
  #役の判定
  def self.judge_hand(cards)
    ranks = cards.map{|c| c.rank}.sort
    suits = cards.map{|c| c.suit}.sort
    pairs   = Hand.get_pairs(cards)

    flag_OP = pairs.select{|p| p.size == 2}.size == 1
    flag_TP = pairs.select{|p| p.size == 2}.size == 2
    flag_TK = pairs.select{|p| p.size == 3}.size == 1
    flag_FK = pairs.select{|p| p.size == 4}.size == 1
    flag_ST = Hand.is_straight(cards)
    flag_FL = Hand.is_flush(cards)
    
    if flag_ST && ranks == [10,11,12,13,14]
      Hand.new(RF, ranks.max)
    elsif flag_ST && flag_FL
      Hand.new(SF, ranks.max)
    elsif flag_FK
      Hand.new(FK, pairs.flatten.map{|c| c.rank}.max)
    elsif flag_OP && flag_TK
      Hand.new(FH, pairs.select{|p| p.size == 3}.flatten.map{|c| c.rank}.max)
    elsif flag_FL
      Hand.new(FL, ranks.max)
    elsif flag_ST
      Hand.new(ST, ranks.max)
    elsif flag_TK
      Hand.new(TK, pairs.flatten.map{|c| c.rank}.max)
    elsif flag_TP
      Hand.new(TP, pairs.flatten.map{|c| c.rank}.max) 
    elsif flag_OP
      Hand.new(OP, pairs.flatten.map{|c| c.rank}.max)
    else
      Hand.new(HC, ranks.max)
    end
  end
  #ストレートかどうか
  def self.is_straight(cards)
    ranks = cards.map{|c| c.rank}.sort
    flag = true
    (NUM_CARDS-1).times{|i|
      if ranks[i+1] - ranks[i] != 1
        flag = false
      end
    }
    flag
  end
  #フラッシュかどうか
  def self.is_flush(cards)
    cards.map{|c| c.suit}.uniq.size == 1
  end
  #ペアを取得
  def self.get_pairs(cards)
    p_dic = {}
    cards.each{|c|
      if p_dic[c.rank] == nil
        p_dic[c.rank] = [c]
      else
        p_dic[c.rank] << c
      end
    }
    p_dic.values.select{|p| p.size >= 2}
  end
end

main

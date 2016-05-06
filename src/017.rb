# -*- coding: utf-8 -*-
# 1 から 5 までの数字を英単語で書けば one, two, three, four, five であり, 全部で 3 + 3 + 5 + 4 + 4 = 19 の文字が使われている.

# では 1 から 1000 (one thousand) までの数字をすべて英単語で書けば, 全部で何文字になるか.

# 注: 空白文字やハイフンを数えないこと. 例えば, 342 (three hundred and forty-two) は 23 文字, 115 (one hundred and fifteen) は20文字と数える. なお, "and" を使用するのは英国の慣習.

W = {
  0    => "",
  1    => "one",
  2    => "two",
  3    => "three",
  4    => "four",
  5    => "five",
  6    => "six",
  7    => "seven",
  8    => "eight",
  9    => "nine",
  10   => "ten",
  11   => "eleven",
  12   => "twelve",
  13   => "thirteen",
  14   => "fourteen",
  15   => "fifteen",
  16   => "sixteen",
  17   => "seventeen",
  18   => "eighteen",
  19   => "nineteen",
  20   => "twenty",
  30   => "thirty",
  40   => "forty",
  50   => "fifty",
  60   => "sixty",
  70   => "seventy",
  80   => "eighty",
  90   => "ninety",
  100  => "hundred",
  1000 => "thousand"
}
MAX = 1000

def main
  char_sum = 0
  (1..MAX).each{|i|
    case i.to_s.size
    when 1,2
      char_sum += num_under100_2_word(i).size
    when 3
      tail = num_under100_2_word(i%100)
      if tail == ""
        char_sum += (W[i/100] + W[100]).size
      else
        char_sum += (W[i/100] + W[100] + "and" + tail).size
      end
    when 4
      char_sum += "onethousand".size #MAX = 1000 の場合，4桁になるのは"1000" のみ
    end 
  }
  puts char_sum
end

def num_under100_2_word(n)
  if n <= 19
    W[n]
  else
    W[(n/10)*10]+W[n%10]
  end
end

main

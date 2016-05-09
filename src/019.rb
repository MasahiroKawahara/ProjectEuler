# -*- coding: utf-8 -*-
# 次の情報が与えられている.

# 1900年1月1日は月曜日である.
# 9月, 4月, 6月, 11月は30日まであり, 2月を除く他の月は31日まである.
# 2月は28日まであるが, うるう年のときは29日である.
# うるう年は西暦が4で割り切れる年に起こる. しかし, 西暦が400で割り切れず100で割り切れる年はうるう年でない.
# 20世紀（1901年1月1日から2000年12月31日）中に月の初めが日曜日になるのは何回あるか?

SUNDAY = 0
MONDAY = 1

def main
  d = MyDate.new(1900,1,1,MONDAY)
  sun_count = 0
  while [d.year, d.month, d.day] != [2000, 12, 31]
    d.become_the_next_day
    if d.year >= 1901
      if d.day == 1 && d.week == SUNDAY
        sun_count += 1
      end
    end
  end
  puts sun_count
end

class MyDate
  attr_reader :year, :month, :day, :week
  def initialize(y, m, d, w)
    @year = y
    @month = m
    @day = d
    @week = w
  end
  def become_the_next_day
    @week = (@week+1)%7
    case @day
    when 28
      #2月でうるう年でない場合，次の月になる
      if @month == 2 && !leap_year?(@year)
        @month += 1
        @day = 1
      else
        @day += 1
      end
    when 29
      #2月でうるう年の場合，次の月になる
      if @month == 2 && leap_year?(@year)
        @month += 1
        @day = 1
      else
        @day += 1
      end
    when 30
      #9,4,6,11月は次の月になる
      if [9,4,6,11].include?(@month)
        @month += 1
        @day = 1
      else
        @day += 1
      end
    when 31
      #12月は次の年になる
      if @month == 12
        @year += 1
        @month,@day = 1,1
      else
        @month += 1
        @day = 1        
      end
    else
      @day += 1
    end
  end
end

#うるう年かどうか
def leap_year?(y)
  y%4 == 0 && !(y%400 != 0 && y%100 == 0)
end

main

h = gets.strip.to_i
m = gets.strip.to_i

BASE_WORDS = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
    }

TENS_WORDS = {
    2 => 'twenty',
    3 => 'thirty',
    4 => 'fourty',
    5 => 'fifty',
    }

def minutes_words(minutes)
    if minutes < 20
        m_words = BASE_WORDS[minutes]
    else
        m_words = TENS_WORDS[minutes / 10]
        m_words += " #{BASE_WORDS[minutes % 10]}" if m_words % 10 != 0
    end
    "#{m_words} #{minutes == 1 ? 'minute' : 'minutes'}"
end

def next_hour(hour)
  hour == 12 ? 1 : hour + 1
end

def time_in_words(h, m)
    if m == 0
        words = "#{BASE_WORDS[h]} o' clock"
    elsif m == 15
        words = "quarter past #{BASE_WORDS[h]}"
    elsif m == 30
        words = "half past #{BASE_WORDS[h]}"
    elsif m == 45
        words = "quarter to #{BASE_WORDS[next_hour(h)]}"
    elsif m < 30
        words = "#{minutes_words(m)} past #{BASE_WORDS[h]}"
    else
        words = "#{minutes_words(60 - m)} to #{BASE_WORDS[next_hour(h)]}"
    end
    puts words
end

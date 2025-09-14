require 'set'

def is_vowel(c)
  "aeiou".include?(c)
end

def mask_vowels(s)
  s.chars.map { |ch| is_vowel(ch) ? 'a' : ch }.join
end

def spellchecker(wordlist, queries)
  exact = Set.new(wordlist)
  lower_map = {}
  vowel_map = {}

  wordlist.each do |w|
    wl = w.downcase
    lower_map[wl] ||= w
    masked = mask_vowels(wl)
    vowel_map[masked] ||= w
  end

  queries.map do |q|
    if exact.include?(q)
      q
    else
      ql = q.downcase
      if lower_map.key?(ql)
        lower_map[ql]
      else
        qmask = mask_vowels(ql)
        vowel_map[qmask] || ""
      end
    end
  end
end

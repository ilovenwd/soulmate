module Soulmate
  module Helpers

    def prefixes_for_phrase(phrase)
      only_prefix = false

      words = normalize(phrase).split(' ').reject do |w|
        Soulmate.stop_words.include?(w)
      end
      if only_prefix
        words.map! do |w|
          (MIN_COMPLETE-1..w.length-1).map{ |l| w[0..l] }
        end
      else
        words.map! do |w|
          (MIN_COMPLETE-1..w.length-1).map{ |l| 
            (0..l).map { |s|
              w[s..l] 
            }
          }
        end
      end
      words = words.flatten.uniq
      #puts '=====',words
      words
    end

    def normalize(str)
      #str.downcase.gsub(/[^a-z0-9 ]/i, '').strip
      str.downcase.strip
    end

  end
end

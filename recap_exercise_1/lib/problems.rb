# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)

    vowel_pairs_arr = []

    vowels = "aeiou"

    words.each_with_index do |word1, i1|
        words.each_with_index do |word2, i2|
            if i2 > i1
                word_pair = [word1, word2].join(" ")
                count = 0
                vowels.each_char do |vowel|
                    if word_pair.include?(vowel)
                        count += 1
                    end
                end
                if count == 5
                    vowel_pairs_arr << word_pair
                end
            end
        end
    end
    vowel_pairs_arr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)

    (2...num).each {|n| return true if num % n == 0}
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)

    found_bigrams = []

    bigrams.each {|bigram| found_bigrams << bigram if str.include?(bigram)}

    found_bigrams
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)

        prc = Proc.new {|k,v| k == v} if prc == nil
        
        new_hash = {}
        self.each {|k,v| new_hash[k] = v if prc.call(k,v)}
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    require "byebug"
    def substrings(length = nil)
        substrings_arr = []
        # self.each_char.with_index do |char1,i1|
        #     #debugger
        #     substring = char1.dup
        #     substrings_arr << substring.dup
        #     self.each_char.with_index do |char2,i2|
        #         if i2 > i1
        #             substring << char2
        #             #debugger
        #             substrings_arr << substring.dup
        #         end
        #     end
        # end

        (0..self.length-1).each do |i1|
            (0..self.length-1).each do |i2|
                if i2 >= i1
                    substrings_arr << self[i1..i2]
                end
            end
        end
        
        if length == nil
            return substrings_arr
        else
            substrings_arr.select {|substring| substring.length == length}
        end
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet_arr = ("a".."z").to_a

        new_str = ""

        #debugger
        self.each_char do |char|
            old_idx = alphabet_arr.index(char)
            new_idx = (old_idx + num) % 26 
            new_str << alphabet_arr[new_idx]
        end

        new_str
    end
end

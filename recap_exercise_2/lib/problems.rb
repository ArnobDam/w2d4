# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
require "byebug"
def least_common_multiple(num_1, num_2)
    num_1_multiples = []
    num_2_multiples = []

    max = num_1 * num_2

    i1 = 1
    product1 = 0
    #debugger
    while product1 < max
        product1 = i1 * num_1
        num_1_multiples << product1
        i1 += 1
    end

    #debugger
    i2 = 1
    product2 = 0
    while product2 <= max
        product2 = i2 * num_2
        num_2_multiples << product2
        i2 += 1
    end

    num_1_multiples.each do |multiple|
        return multiple if num_2_multiples.include?(multiple)
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams_hash = Hash.new(0)

    i = 0
    while i < str.length-1
        bigrams_hash[str[i..i+1]] += 1
        i += 1
    end

    max_count = 0
    ans_bigram = ""
    bigrams_hash.each do |k,v|
        if v > max_count
            max_count = v
            ans_bigram = k
        end
    end
    ans_bigram    
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each {|k,v| new_hash[v] = k}
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |ele1,i1|
            self.each_with_index do |ele2,i2|
                if i2 > i1
                    count += 1 if ele1 + ele2 == num
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        if prc == nil
            sorted = false

            while !sorted
                sorted = true
                (0...self.length-1).each do |i|
                    if self[i] > self[i+1]
                        self[i], self[i+1] = self[i+1], self[i]
                        sorted = false
                    end
                end
            end
            return self
        else
            sorted = false

            while !sorted
                sorted = true
                (0...self.length-1).each do |i|
                    if prc.call(self[i], self[i+1]) == 1
                        self[i], self[i+1] = self[i+1], self[i]
                        sorted = false
                    end
                end
            end
            return self
        end
    end
end

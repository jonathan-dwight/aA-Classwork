require "set"

# o(n!) permutations
# o(1) black magic - getting the PHD

#arr = [0, 3, 2, 5, 6]  [9, 11] -- sum of two els target = 6

# o(n^2) idx and jdx
def bad_sum?(arr, target)

    (0...arr.length).each do |idx|
        (idx + 1...arr.length).each do |jdx|
            return true if arr[idx] + arr[jdx] == target
        end
    end
    false
end

# p bad_sum?([0, 1, 5, 7], 6)
# p bad_sum?([0, 2, 3, 5, 6, 9, 11], 22)

# start with o(n log n) + ?

# return true if start + finish == target
# return false if start == finish

# mid + 1 <= target --- split there... else mid on

def okay_sum(arr, target, start = 0, finish = arr.length-1)
    return true if arr[start] + arr[finish] == target
    return false if start == finish

    mid = (finish - start) / 2 + start

    case target <=> arr[mid]
    when -1
        okay_sum(arr, target, start, mid)
    when 0
        #dont know what to do with 0
    when 1
        okay_sum(arr, target, mid+1, finish)

    end
end



# arr.sort # nlogn
# arr.select! # n

# until arr.first + arr.last == target
#     arr.shift
# end



# if arr.length == 0
#     return false
# else
#     return true
# end

def better_sum1(arr, target) # this one is going to return true or false
    pairs = Set.new

    arr.each do |ele|
        if pairs.include?(ele)
            return true
        else
            pairs << target - ele
        end
    end
    false
end


def better_sum_with_idx1(arr, target)
    check_hash = Hash.new

    pairs = []

    arr.each_with_index do |ele, idx|
        if check_hash.include?(ele)
            pairs << [check_hash[ele], idx]
            check_hash.delete(ele)
        else
            check_hash[target-ele] = idx
        end
    end
    pairs

end

arr = [0, 1, 5, 7, 3, 10, 2]
p better_sum1(arr, 6)
p better_sum1(arr, 10)


# o(n) iterate once over arr -- Hash Map

# [0,1,5,7]
# pair_ set = [6, 5 ] target - idx 
# target - 0 

def better_sum?(arr, target)
    pair_set = Set.new

    arr.each do |ele|
        if pair_set.include?(ele)
            return true
        else
            pair_set << target - ele
        end
    end

    false

end

def better_sum_with_idx(arr, target)
    hash1 = Hash.new

    pairs = []

    arr.each_with_index do |ele, idx|
        if hash1.include?(ele)
            pairs << [hash1[ele], idx]
            hash1.delete(ele)
        else
            hash1[target-ele] = idx
        end
    end
    return pairs
end

# p better_sum_with_idx([0, 1, 5, 7], 6)
    # p better_sum1([0, 2, 3, 5, 6, 9, 11], 22)
    # arr = [0, 1, 5, 7, 3, 10, 2]
    # p better_sum_with_idx(arr, 6)
    # p better_sum_with_idx(arr, 10)
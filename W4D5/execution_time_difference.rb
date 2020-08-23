

# o(n^2)
def my_min1(arr)
    count_hsh = Hash.new(0)

    (0...arr.length).each do |idx_1|
        (0...arr.length).each do |idx_2|
            if arr[idx_1] < arr[idx_2] 
                count_hsh[arr[idx_1]] += 1
            end
        end
    end

    count_hsh.each {|k, v| return k if v == count_hsh.values.max}

end

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

# o(n)
def my_min(arr)
    min = 0

    arr.each do |el|
        min = el if el < min
    end

    min

end

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

#o(n^2)
def largest_contiguous_subsum1(arr)
    subs = []

    i = 0
    (i...arr.length).each do |idx|
        j = i  
        (j...arr.length).each do |jdx|
            subs.push(arr[idx..jdx].sum)
        end
    end

    return subs.max
    
end

# 
# current arr check = [7, -6, 7 ]
# one -largest sum so far # 8
# current - sum  # 2 5 -1, 7

def largest_contiguous_subsum(arr)

    largest_sum = arr[0]
    current_sum = 0

    (0...arr.length).each do |idx|
        current_sum = current_sum + arr[idx]
        if current_sum > largest_sum
            largest_sum = current_sum
        end
        current_sum = 0 if current_sum < 0
    end
    largest_sum
end

p largest_contiguous_subsum([2, 3, -6, 7, -6, 7])
p largest_contiguous_subsum([-5, -1, -3])

# cs: [2, 5, 0, 7, 1, 8]
# ls: [2, 5, 7, 8]


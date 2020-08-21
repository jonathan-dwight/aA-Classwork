
# [-5, 7, 5] = [[0, 2]]
# [-5, 0, 7, -7, 5] = [[0, 4], [2,3]]

# (1) takes array (done)
# (2) return all and only pairs #include 0,2 (done)
# (3) return pairs in dictionary order (done)

# [...]
# sort it  : nlogn  /   BINARY SEARCH = log(n) 
# []
# i = 0 # incrementing i
# j = length-1 # decrementing j

def two_sum(arr)
    output = []
    (0...arr.length).each do |idx1|
        (idx1+1...arr.length).each do |idx2|
            output << [idx1, idx2] if arr[idx1] + arr[idx2] == 0
        end
    end
    output
end

p two_sum([5, 7, -5])

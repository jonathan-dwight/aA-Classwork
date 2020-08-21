# (1) takes a matrix (done)
# (2) return matrix has transposed dimensions (done)
# (3) actually transposes values (done)
# (4) handles empty matrix

def my_transpose(matrix)
    
    # for every (i, j) in matrix
    # output[j][i] = matrix[i][j]
    return [] if matrix == []

    output = Array.new(matrix[0].length) {[]}
    i = 0
    while i < matrix[0].length
        matrix.each do |sub|
            output[i] << sub[i]
        end
        i += 1
    end
    output  
end
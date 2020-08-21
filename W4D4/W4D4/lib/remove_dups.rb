# tests
# (1) every element when counted is 1 / 
    # we're writing func1....but we also have available func2....
    # func2 returns true if func1 actually worked
# (1')  actually removes dups, in the concrete case of [...]
# Sub-questions to consider: is (1) even possible in RSPEC?, (2) if so, is it dispreferred?

# Testing agenda
# (-1) does this function exist? (DONE)
# (0) accepts array as argument (DONE)
# (0.5) returns array (done)
# (0.75) array is different (done)
# (1') does remove dups in some concrete case with dups (done)
# (2') doesn't mess up already unique array (done)
# (3) doesn't crash when passed [] as argument

 def my_uniq(arr)
    
    output = []
    hash = Hash.new(false)
    
    arr.each do |x|
        output << x if !hash[x]
        hash[x] = true
    end
    output
 end
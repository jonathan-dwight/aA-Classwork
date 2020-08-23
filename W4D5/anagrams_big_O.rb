
# o(n!)
def first_anagrams?(str_1, str_2)
    perms = str_1.split("").permutation.to_a
    perms.map! {|word| word.join("")}
    perms.include?(str_2)
end

# p first_anagrams?("elvis", "lives")
# p first_anagrams?("gizmo", "sally")

# o(n*m)
def second_anagram?(str_1, str_2)
    # iterate the string 1... grab its index in string 2
    # pop it off
    # if str_2.empty return true
    str_2_arr = str_2.split("")

    str_1.each_char do |char| #n
        if str_2_arr.find_index(char) == nil #m 
            return false 
        else
            str_2_arr.delete_at(str_2_arr.find_index(char))
        end
    end

    return true if str_2_arr.empty?

end

# p second_anagram?("elvis", "lives")
# p second_anagram?("gizmo", "sally")

# o(n log n)
def third_anagram?(str_1, str_2)

    str_1.split("").sort!.join("") == str_2.split("").sort!.join("")

end

# p third_anagram?("elvis", "lives")
# p third_anagram?("gizmo", "sally")


# o(n + m)
def fourth_anagram?(str_1, str_2)
    str_1_hsh = Hash.new(0)

    str_1.each_char { |char| str_1_hsh[char] += 1}
    str_2.each_char { |char| str_1_hsh[char] -= 1}

    str_1_hsh.values.all? { |el| el == 0 } ? true : false
    
end

p fourth_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")
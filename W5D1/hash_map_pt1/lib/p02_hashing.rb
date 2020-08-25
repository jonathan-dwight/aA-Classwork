class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
  # represent what were iterating through with the hash
  # [1,2,3] - iterate and do .hash (add up all the numbers) - hash representation
  # [3,2,1] - would be the the same hash_value... 
    hash_number = 0
    self.each_with_index do |ele, idx|
      hash_number += (ele.hash * idx.hash) 
    end
    hash_number
  end
end

class String
  def hash
    alpha = ("a".."z").to_a
    counter = 0

    self.each_char.with_index do |char, i|
      counter += (alpha.index(char).hash * i.hash)
    end

    counter
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alpha = ("a".."z").to_a
    counter = 0
    self.values.each do |ele|
      if ele.is_a?(String)
        counter += alpha.index(ele).hash
      else  
        counter += ele.hash
      end
    end

    counter
  end
end

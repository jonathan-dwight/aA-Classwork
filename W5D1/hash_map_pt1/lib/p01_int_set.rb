require "byebug"
class MaxIntSet 
  attr_accessor :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless num.between?(0, self.store.length)
    self.store[num] = true
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    self.store[num] == true ? true : false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    check = num % 20
    @store[check] << num
  end

  def remove(num)
    check = num % 20
    @store[check].delete(num)
  end

  def include?(num)
    check = num % 20
    self.store[check].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  # keep track of count
  # count > n --- resize!

  attr_accessor :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    check = num % self.store.length
    
    if !self.include?(num)
      self.store[check] << num
      self.count += 1
    end
    if self.count > self.store.length
      resize!
    end
  end

  def remove(num)
    check = num % self.store.length
    if self.include?(num)
      self.store[check].delete(num)
      self.count -= 1
    end
  end

  def include?(num)
    check = num % self.store.length
    self.store[check].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    copy_store = self.store.dup
    self.store = Array.new(self.store.length * 2) { Array.new }
    self.count = 0 #reset counter when resizing!
    
    copy_store.each do |sub|
      sub.each do |el|
        self.insert(el)
      end
    end

    self.store
  end
end

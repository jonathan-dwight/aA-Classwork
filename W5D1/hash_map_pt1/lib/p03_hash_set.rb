require 'byebug'

class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    check = key.hash % num_buckets
    if !self.include?(key)
      self.store[check] = key
      self.count += 1
    end
    if self.count > num_buckets
      resize!
    end
  end

  def include?(key)
    check = key.hash % num_buckets
    self.store.include?(key)
  end

  def remove(key)
    check = key.hash % num_buckets
    if self.include?(key)
      self.store.delete(key)
      self.count -= 1
    end
  end

  private

  def [](num)
    # @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def []=(num, key)
    # @store[num] = key
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
      self.insert(sub)
    end

    self.store

  end
end

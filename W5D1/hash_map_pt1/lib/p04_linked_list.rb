class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList < Node
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : self.head.next
  end

  def last
    empty? ? nil : self.tail.prev
  end

  def empty?
    self.head.next == self.tail 
  end

  def get(key)
    self.each {|node| return node.val if node.key == key}
    nil
  end

  def include?(key)
    self.any? {|node| return true if node.key == key }
  end

  def append(key, val)
    node = Node.new(key, val)
    # set a new tail
    # set a new 
    # just modify next for previous tail
    # had to create the first and last.. for specs to past
    self.tail.prev.next = node
    node.prev = self.tail.prev
    node.next = self.tail # dont wan't it to equal nil?
    self.tail.prev = node
    node

  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.prev.next = node.next 
        node.next.prev = node.prev
        return node.val
      end
    end
    nil
  end

  def each
    current_node = self.head.next
    until current_node == self.tail
      yield current_node
      current_node = current_node.next
    end

  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

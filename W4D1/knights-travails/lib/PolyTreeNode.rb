require "byebug"

class PolyTreeNode
    
    attr_accessor :value, :parent, :children

    def initialize(val)
        @parent = nil
        @children = []
        @value = val
    end
    
    def parent=(parent)
        if @parent == nil && parent != nil
            @parent = parent 
            parent.children << self
        else  
            @parent.children.delete(self) # no longer in parents child array
            @parent = parent
            parent.children << self if parent != nil
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
    end
    
    def bfs(target)
        queue = Queue.new
        queue.enq(self)
    
        until queue.empty?
            current_node = queue.deq
            return current_node if current_node.value == target
            current_node.children.each {|child| queue.enq(child)}
        end
        nil
    end
    
    def dfs(target)
        return self if self.value == target
        self.children.each do |child| 
            result = child.dfs(target)
            return result if result != nil 
        end
        return nil
    end

end

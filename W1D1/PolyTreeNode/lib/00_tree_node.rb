

class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent.children.delete(self) unless @parent == nil
        @parent = node
        @parent.children << self unless @parent == nil || @parent.children.include?(self)
    end

    def add_child(node)
        @children << node
        node.parent = self
    end

    def remove_child(node)
        raise "Node is not a child" unless @children.include?(node)
        node.parent = nil
        @children.delete(node)
    end

    def dfs(target_value)
        return self if self.value == target_value
        @children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(target_value)
        nodes = [self]
        until nodes.empty?
            current_node = nodes.shift
            return current_node if current_node.value == target_value
            nodes += current_node.children
        end
        nil
    end

end
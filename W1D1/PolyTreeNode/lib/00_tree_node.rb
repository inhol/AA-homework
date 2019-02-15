

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

    



end
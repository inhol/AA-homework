# stack.rb

require 'byebug'
require 'rspec'


class Stack

    attr_reader :arr
    
    def initialize(*values)
        # create ivar to store stack here!
        @arr = values
    end

    def push(el)
        # adds an element to the stack
        arr.push(el)
    end

    def pop
        # removes one element from the stack
        arr.pop
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        arr.last
    end
end
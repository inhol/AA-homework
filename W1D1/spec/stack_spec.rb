require 'stack'

describe Stack do

    describe "#iniatilize" do

        it "creates an empty array" do
            expect(Stack.new.arr).to eq([])
        end

        it "creates an array from values" do
            expect(Stack.new(1,2,3).arr).to eq([1,2,3])
        end

    end 


    # def initialize(*values)
    #     # create ivar to store stack here!
    #     @stack = [values]
    # end

    # def push(el)
    #     # adds an element to the stack
    # end

    # def pop
    #     # removes one element from the stack
    # end

    # def peek
    #     # returns, but doesn't remove, the top element in the stack
    # end


end
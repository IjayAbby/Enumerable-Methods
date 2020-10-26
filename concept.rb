#Block with parameters
-A block is code between a set of curly brackets or a do/end pair
-do/end pair is used for multiline definition and {}
is used for single line definition.
-Yield statement is used to call a block inside the method using the yield keyword with a value


def test()

    puts "You are in the method"

    yield 5  #invokes the method 
end

test {
    |i| puts "You are in the block #{i}"
}

N.B  flow is 
1.Block{}
 test{}
2.Method()
test{}

3.yield
4.Execute the code of block
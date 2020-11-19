require './lib/enumerables.rb'

describe Enumerable do 
  describe '#my_each' do
      it 'return an number in its original form' do
          #enumerable = Enumerable.new
          expect(Enumerable.my_each([1, 2, 3])).to eql(2, 3, 4)
      end
  end

end
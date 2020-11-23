require_relative '../enumerables'
describe Enumerable do
describe '#my_each' do
    it 'return array' do
        expect([1,2,3].my_each).to eql([1,2,3])
    end
end
end

# require 'rspec'
# rubocop:disable Metrics/LineLength
require_relative '../enumerables'

RSpec.describe Enumerable do
  let(:my_array) { %w[Ijay Mike Nana] }
  let(:num_array) { [1, 4, 6, 3] }

  context '#my_each' do
    it 'return an number in its original form' do
      expect(num_array.my_each { |elem| }).to eql(num_array.each { |elem| })
    end

    it 'should return each array items' do
      expect(my_array.my_each { |el| el }).to eq(my_array.each { |x| })
    end
  end

  context '#my_each_with_index' do
    it 'returns index of an item' do
      expect(num_array.my_each_with_index { |index| }).to eql(num_array.each { |index| })
    end
  end

  context '#my_select' do
    it 'it should return "Mike"' do
      expect(my_array.my_select { |elem| elem == 'Mike' }).to eql(my_array.select { |elem| elem == 'Mike' })
    end
  end

  context '#my_all?' do
    it 'return true if every element is 3' do
      expect([3, 3, 3].my_all? { |num| num == 3 }).to eql(true)
    end

    it 'return false if every element is not 3' do
      expect([3, 6, 3].my_all? { |num| num == 3 }).to eql(false)
    end
  end

  context '#my_any?' do
    it 'return true if one of the element is 3' do
      expect(num_array.my_any? { |num| num == 3 }).to eql(true)
    end

    it 'return false if none of the  element is  3' do
      expect([26, 6, 13].my_any? { |num| num == 3 }).to eql(false)
    end
  end

  context '#my_none?' do
    it 'return element if none of the element fits' do
      expect(my_array.my_none? { |elem| elem == 'Paris' }).to eql(true)
    end
  end

  context '#my_count' do
    it 'it should return the number of elements in this case 4' do
      expect(num_array.my_count).to eql(4)
    end
  end

  context '#my_map' do
    it 'return a new array of mulyiply by 3' do
      expect(num_array.map { |elem| 3 * elem }).to eql(num_array.map { |elem| 3 * elem })
    end
  end

  context '#my_inject' do
    it 'should return 10' do
      expect(num_array.my_inject { |sum, elem| sum + elem }).to eql(14)
    end

    it '#my_inject raises a "LocalJumpError" when no block or argument is given Failure/Error' do
      expect { my_array.my_inject }.to raise_error(LocalJumpError)
    end
  end

  context '#multiply_els' do
    it 'should return the multiplication of all the elements' do
      expect(multiply_els([2, 4, 5])).to eq(40)
    end
  end
end
# rubocop:enable Metrics/LineLength

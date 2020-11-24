# require 'rspec'
# rubocop:disable Metrics/LineLength
require_relative '../enumerables'

RSpec.describe Enumerable do
  let(:my_array) { %w[Ijay Mike Nana] }
  let(:num_array) { [1, 4, 6, 3] }
  let(:my_range) { (1..10) }

  context '#my_each' do
    it 'when no block given, my_each method should return an enumerator' do
      expect(my_array.my_each).to be_an(Enumerator)
    end

    it 'return an number in its original form' do
      expect(num_array.my_each { |elem| }).to eql(num_array.each { |elem| })
    end

    it 'should return each array items' do
      expect(my_array.my_each { |el| el }).to eq(my_array.each { |x| })
    end
  end

  context '#my_each_with_index' do
    it 'when no block given, my_each_with_index method should return an enumerator' do
      expect(my_array.my_each_with_index).to be_an(Enumerator)
    end

    it 'returns index of an item' do
      expect(num_array.my_each_with_index { |index| }).to eql(num_array.each { |index| })
    end

    it 'should return each item from a given range' do
      expect(my_range.my_each_with_index { |el| el }).to eq(my_range.each { |el| })
    end

    it 'should return every even element' do
      expect(my_array.my_each_with_index { |el, index| el if index % 3 == 0 }).to eql(my_array.each_with_index { |el, index| el if index % 3 == 0 })
    end
  end

  context '#my_select' do
    it 'when no block given, my_select method should return an enumerator' do
      expect(my_array.my_select).to be_an(Enumerator)
    end

    it 'it should return "Mike"' do
      expect(my_array.my_select { |elem| elem == 'Mike' }).to eql(my_array.select { |elem| elem == 'Mike' })
    end

    it 'should return every element except the selected element' do
      expect(my_range.my_select { |el| el != 5 }).to eql(my_range.reject { |el| el == 5 })
    end
  end

  context '#my_all?' do
    it 'should return enumerator object if block is not given' do
      expect(my_array.my_all?.instance_of?(Enumerator)).to be(false)
    end

    it 'return true if every element is 3' do
      expect([3, 3, 3].my_all? { |num| num == 3 }).to eql(true)
    end

    it 'return false if every element is not 3' do
      expect([3, 6, 3].my_all? { |num| num == 3 }).to eql(false)
    end

    it 'should return true if there is no block and array is empty' do
      expect([].my_all?).to eq(true)
    end
  end

  context '#my_any?' do
    it 'should return enumerator object if block is not given' do
      expect(my_array.my_any?.instance_of?(Enumerator)).to be(false)
    end

    it 'return true if one of the element is 3' do
      expect(num_array.my_any? { |num| num == 3 }).to eql(true)
    end

    it 'return false if none of the  element is  3' do
      expect([26, 6, 13].my_any? { |num| num == 3 }).to eql(false)
    end
  end

  context '#my_none?' do
    it 'should return enumerator object if block is not given' do
      expect(my_array.my_none?.instance_of?(Enumerator)).to be(false)
    end

    it 'return element if none of the element fits' do
      expect(my_array.my_none? { |elem| elem == 'Paris' }).to eql(true)
    end

    it 'should return true because  array are string ' do
      expect(my_array.my_none?(String)).to eql(my_array.none?(String))
    end

    it 'should return false beacuse there is 2 in array' do
      expect(num_array.my_none?(2)).to eql(num_array.none?(2))
    end

    it 'should return true because there is no 4 four in array' do
      expect([1, 2, 3].my_none?(4)).to eql([1, 2, 3].my_none?(4))
    end

    it 'should return false beacuse  array is not none ' do
      expect(my_array.my_none?).to eql(my_array.none?)
    end
  end

  context '#my_count' do
    it 'should return enumerator object if block is not given' do
      expect(my_array.my_count.instance_of?(Enumerator)).to be(false)
    end

    it 'should return the number of elements in this case 4' do
      expect(num_array.my_count).to eql(4)
    end

    it 'should return elements from 1 to 10' do
      expect(my_range.my_count).to eql(my_range.count)
    end

    it 'should return count of upper case elements in array' do
      expect(%w[IJAY JAY PHIL CICI doll].my_count { |s| s == s.upcase }).to eq(%w[IJAY JAY PHIL CICI doll].count { |s| s == s.upcase })
    end

    it 'should return count 3 in array' do
      expect(my_array.my_count(3)).to eq(my_array.count(3))
    end
  end

  context '#my_map' do
    it 'should return enumerator object if block is not given' do
      expect(my_array.my_map.instance_of?(Enumerator)).to be(true)
    end

    it 'return a new array of mulyiply by 3' do
      expect(num_array.map { |elem| 3 * elem }).to eql(num_array.map { |elem| 3 * elem })
    end

    it 'my_map should return with not operation' do
      expect([false, true].my_map(&:!)).to eq([false, true].map(&:!))
    end

    it 'should return the array with squared element of each element' do
      my_proc = proc { |x| x + 2 }
      expect(my_range.my_map(my_proc)).to eq([3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    end
  end

  context '#my_inject' do
    it 'should return 10' do
      expect(num_array.my_inject { |sum, elem| sum + elem }).to eql(14)
    end

    it '#my_inject raises a "LocalJumpError" when no block or argument is given Failure/Error' do
      expect { my_array.my_inject }.to raise_error(LocalJumpError)
    end

    it 'my_inject will return the the array + 15' do
      expect(num_array.my_inject(15) { |accum, elem| accum + elem }).to eq(num_array.inject(15) { |accum, elem| accum + elem })
    end
  end

  context '#multiply_els' do
    it 'should return the multiplication of all the elements' do
      expect(multiply_els([2, 4, 5])).to eq(40)
    end
  end
end
# rubocop:enable Metrics/LineLength

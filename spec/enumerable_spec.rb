# require 'rspec'
# rubocop:disable Metrics/LineLength
require_relative '../enumerables'

RSpec.describe Enumerable do
  context '#my_each' do
    it 'return an number in its original form' do
      expect([1, 2, 3].my_each { |elem| }).to eql([1, 2, 3].each { |elem| })
    end
  end
  context '#my_each_with_index' do
    it 'returns index of an item' do
      expect([1, 4, 6].my_each_with_index { |index| }).to eql([1, 4, 6].each { |index| })
    end
  end
  context '#my_select' do
    it 'it should return "Mike"' do
      expect(%w[Ijay Mike Nana].my_select { |elem| elem == 'Mike' }).to eql(%w[Ijay Mike Nana].select { |elem| elem == 'Mike' })
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
      expect([4, 3, 9].my_any? { |num| num == 3 }).to eql(true)
    end
    it 'return false if none of the  element is  3' do
      expect([26, 6, 13].my_any? { |num| num == 3 }).to eql(false)
    end
  end
  context '#my_none?' do
    it 'return element if none of the element fits' do
      expect(%w[Nairobi Yerevan Addis Ababa].my_none? { |elem| elem == 'Paris' }).to eql(true)
    end
  end
  context '#my_count' do
    it 'it should return the number of elements in this case 4' do
      expect([1, 3, 4, 6].my_count).to eql(4)
    end
  end
  context '#my_map' do
    it 'return a new array of mulyiply by 3' do
      expect([1, 4, 6].map { |elem| 3 * elem }).to eql([1, 4, 6].map { |elem| 3 * elem })
    end
  end
  context '#my_inject' do
    it 'should return 10' do
      expect([1, 2, 3, 4].my_inject { |sum, elem| sum + elem }).to eql(10)
    end
  end
end
# rubocop:enable Metrics/LineLength

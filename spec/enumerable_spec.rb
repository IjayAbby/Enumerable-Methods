# require 'rspec'
require_relative '../enumerables'

RSpec.describe Enumerable do
  context "#my_each" do
    it "return an number in its original form" do
      expect([1, 2, 3].my_each { |el| el }).to eql([1, 2, 3].each { |el| el })
    end
  end
  context '#my_each_with_index' do
    it "returns index of an item" do
      expect([1, 4, 6].my_each_with_index { |el, index| index }).to eql([1, 4, 6].each_with_index { |el, index| index })
    end
  end
  context '#my_select' do
    it 'it should return "Mike"' do
      expect(["Ijay", "Mike", "Nana"].my_select { |el| el == "Mike" }).to eql(["Ijay", "Mike", "Nana"].select { |el| el == "Mike" })
    end
  end
  context "#my_all?" do
    it "return true if every element is 3" do
      expect([3, 3, 3].my_all? { |num| num == 3 }).to eql(true)
    end
    it "return false if every element is not 3" do
      expect([3, 6, 3].my_all? { |num| num == 3 }).to eql(false)
    end
  end
  context '#my_any?' do
    it "return true if one of the element is 3" do
      expect([4, 3, 9].my_any? { |num| num == 3 }).to eql(true)
    end
    it "return false if none of the  element is  3" do
      expect([26, 6, 13].my_any? { |num| num == 3 }).to eql(false)
    end
  end
  context '#my_none?' do
    it 'return element if none of the element fits' do
      expect(['Nairobi', 'Yerevan', 'Addis Ababa'].my_none?{ |el| el == 'Paris'}).to eql(true)
    end
  end
  context '#my_count' do
    it 'it should return the number of elements in this case 4' do
      expect([1,3,4,6].my_count).to eql(4)
    end
  end
  context '#my_map' do
    it 'return a new array capitalized' do
      expect(['cat','dog','roaster'].map{ |el| el.capitalize}).to eql(['Cat','Dog','Roaster'])
    end
  end
  context '#my_inject' do
    it 'should return 10' do
      expect([1,2,3,4].my_inject{ |sum,el| sum + el}).to eql(10)
    end
  end
end
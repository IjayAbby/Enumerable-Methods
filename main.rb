module Enumerable
    # 1. my_each method
    my_array = [1, 2, 4, 44, 23]

  def my_each(arr)
    return to_enum(:my_each) unless block_given?

      (arr.length).times do |index|
      yield(arr[index])
      
    end
    arr
  end

  my_each(my_array) { |num| puts "#{num} is a number"}

  # 2. my_each_with_index
  animals = ['dog','cat','horse']
  
  def my_each_with_index(arr)
    return to_enum(:my_each_with_index) unless block_given?
    (arr.length).times do |index|
      yield(arr[index],index)
    end
    arr

  end
  my_each_with_index(animals) {|name, index| puts "My favourite pet is a [#{name}, #{index}]"}



  # 3.my_select

  countries = ['kenya','netherlands','tanzania']

  def my_select(arr)
    return to_enum(:my_select) unless block_given?
    new_countries = []
    (arr.length).times do |i|
      new_countries << arr[i] if yield(arr[i])
      
    end
    puts new_countries
  end 
  
  my_select(countries) { |country| country.length > 6}

# 4.my_all?

end 

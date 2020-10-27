#rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
# rubocop:disable Style/CaseEquality
module Enumerable
  # 1. my_each method

  def my_each
    return to_enum(:my_each) unless block_given?

    array = to_a
    size.times { |index| yield array[index] }
    self
  end

  # 2. my_each_with_index
  def my_each_with_index
    return to_enum unless block_given?

    arr = to_a
    pos = 0
    while pos < arr.length
      yield(arr[pos], pos)
      pos += 1
    end

    self
  end

  # 3.my_select

  def my_select
    return to_enum(:my_select) unless block_given?

    new_arr = []
    to_a.my_each { |item| new_arr << item if yield(item) }
    new_arr
  end

  # 4.my_all?

  def my_all?(args = nil)
    if block_given?
      counter_false = 0
      my_each { |num| counter_false += 1 unless yield num }
      counter_false.zero?
    elsif args.nil
      my_all? { |num| num }
    else
      my_all? { |num| args == num }
    end
  end

  # 5.my_any?

  def my_any?(args = nil)
    if block_given?
      counter_true = 0
      my_each { |num| counter_true += 1 if yield num }
      counter_true.positive?
    elsif args.nil?
      my_any? { |num| num }
    else
      my_any? { |num| args == num }
    end
  end
end

# 6.my_none?

def my_none?(args = nil)
  if block_given?
    counter_true = 0
    my_each { |num| counter_true += 1 if yield num }
    counter_true.zero?
  elsif args.nil?
    my_none? { |num| num }
  else
    my_none? { |num| args == num }
  end
end

# 7.my_count

def my_count(args = nil)
  count = 0
  if block_given?
    to_a.my_each { |item| count += 1 if yield item }
  elsif !block_given? && args.nil?
    count = to_a.length
  else
    count = to_a.my_select { |item| item == args }.length
  end
  count
end

# 8.my_maps

def my_map(args = nil)
  return to_enum(:my_map) if args.nil? && !block_given?

  map_array = to_a
  new_array = []
  if !args.nil?
    map_array.length.times do |i|
      new_array << args.call(map_array[i])
    end
  elsif block_given?
    map_array.length.times do |i|
      new_array << yield(map_arr[i])
    end
  else return to_enum
  end
  new_array
end

# 9.my_inject

def my_inject(*arg)
  array = to_a
  arg1 = arg[0]
  arg2 = arg[1]

  both_args = arg1 && arg2
  only_one_arg = arg1 && !arg2
  no_arg = !arg1

  raise LocalJumpError if !block_given? && no_arg

  result = both_args || (only_one_arg && block_given?) ? arg1 : array.first

  if block_given?
    array.drop(1).my_each { |next_element| result = yield(result, next_element) } if no_arg

    array.my_each { |next_element| result = yield(result, next_element) } if only_one_arg
  else
    array.drop(1).my_each { |next_element| result = result.send(arg1, next_element) } if only_one_arg

    array.my_each { |next_element| result = result.send(arg2, next_element) } if both_args
  end
  result
end

# 10. multiply_els

def multiply_els(array)
  array.my_inject(:*)
end

block = proc { |num| num < (0 + 9) / 2 }

range = Range.new(5, 50)

p range.my_each_with_index(&block)


#rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
# rubocop:enable Style/CaseEquality
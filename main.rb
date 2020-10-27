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
      my_all? { |num| args === num }
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
      my_any? { |num| args === num }
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
    my_none? { |num| args === num }
  end
end

#7.my_count

def my_count(args = nil)
  count = 0
  if block_given?
    to_a.my_each { |item| count += 1 if yield (item) }
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
  else return to_enum   end
  new_array
end

# 9.my_inject

def my_inject(first_arg = nil, second_arg = nil)
  accumul = to_a[0]
  rest = to_a[1..-1]
  code = proc { |el| accumul = yield(accumul, el) }
  raise LocalJumpError if !block_given? && first_arg.nil? && second_arg.nil?

  if block_given?
    unless first_arg
      rest.my_each(&code)
      return accumul
    end
    accumul = first_arg
    to_a.my_each(&code)
    return accumul
  end

  if first_arg && second_arg
    accumul = first_arg
    my_each { |el| accumul = accumul.send(second_arg, el) }
    return accumul
  end
  rest.my_each { |el| accumul = accumul.send(first_arg, el) } if first_arg.is_a?(Symbol)

  accumul
end

# 10. multiply_els

def multiply_els(array)
  array.my_inject(:*)
end

block = proc { |num| num < (0 + 9) / 2 }

range = Range.new(5, 50)

p range.my_each_with_index(&block)

# countries = ['kenya','netherlands','tanzania']

# def my_select(arr)
#   return to_enum(:my_select) unless block_given?
#   new_countries = []
#   (arr.length).times do |i|
#     new_countries << arr[i] if yield(arr[i])
    
#   end
#   puts new_countries
# end 

# my_select(countries) { |country| country.length > 6}
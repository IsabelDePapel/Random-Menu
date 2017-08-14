# # create 3 arrays of ten items each
#
# adj_list = ["hot", "cold", "spicy", "crispy", "crunchy", "chewy", "soft", "hard", "buttery", "peppery"]
#
# style_list = ["boiled", "steamed", "grilled", "barbecued", "stir-fried", "fried", "poached", "raw", "pureed", "mashed"]
#
# food_list = ["dumplings", "rice", "chicken breast", "ceviche", "duck", "rack of lamb", "soup", "cake", "flan", "quiche"]

# store all food info in a hash
# starter lists so user doesn't have to input everything
menu = { adjective: ["hot", "cold", "spicy", "crispy", "chewy"],
         style: ["steamed", "grilled", "barbecued", "baked", "fried"],
         food: ["dumplings", "rice", "ceviche", "duck breast", "lamb chop"] }

# method that checks if given string input is an int
def is_int(num_str)
  if num_str.match(/\A-?(\d+)\Z/)
    return true
  else
    return false
  end
end

# method that prints out the contents of an array, one item per new line
# each item in the array is a string
def print_list(list)
  list.each do |item|
    puts item
  end
end

# method that promps user to add item to item_type list
# item_type is the name of the list (adj, style, food)
def get_item(item_type)
  menu = { adjective: ["hot", "cold", "spicy", "crispy", "chewy"],
           style: ["steamed", "grilled", "barbecued", "baked", "fried"],
           food: ["dumplings", "rice", "ceviche", "duck breast", "lamb chop"] }

  puts "What #{item_type} would you like to add?\nHit ENTER or type 'none' to finish adding to list"
  ans = gets.chomp.downcase

  # while ans != none or empty string, add items to list
  while ans != "none" && ans.length != 0

    # check if already in list
    if !menu[item_type.to_sym].include?(ans)
      menu[item_type.to_sym] << ans
      puts "#{ans.capitalize} added. What #{item_type} would you like to add?"
      ans = gets.chomp.downcase

    else
      puts "#{ans.capitalize} already in list. What #{item_type} would you like to add?"
      ans = gets.chomp.downcase
    end
  end

  # return edited menu
  return menu[item_type.to_sym]
end

puts "==== Menu Time ===="

# get user input
puts "This is the adjective list:"
print_list(menu[:adjective])
menu[:adjective] = get_item("adjective")

puts "This is the cooking style list:"
print_list(menu[:style])
menu[:style] = get_item("style")

puts "This is the food list:"
print_list(menu[:food])
menu[:food] = get_item("food")

print "\nHow many items would you like to see? "

num_items = gets.chomp

# max num of possible menu items
adj_list = menu[:adjective]
style_list = menu[:style]
food_list = menu[:food]

max_items = [adj_list.length, style_list.length, food_list.length].min

# check that input is valid
until is_int(num_items) && num_items.to_i >= 1 && num_items.to_i <= max_items
  print "Please pick a number between 1 and #{max_items}: "
  num_items = gets.chomp
end

num_items = num_items.to_i

puts "\nloading menu..."
puts "\n"

(1..num_items).each do |num|
  # randomly select element from array & delete to avoid repeats
  adj = adj_list[rand(adj_list.length)]
  adj_list.delete(adj)

  style = style_list[rand(style_list.length)]
  style_list.delete(style)

  food = food_list[rand(food_list.length)]
  food_list.delete(food)

  puts "#{num}.  #{adj} #{style} #{food}"
end

require 'linkedlist'
require 'time'

puts "| Times | Array | LinkedList |"
puts "|------:|------:|-----------:|"

[10, 1000, 10000, 100000].each do |n|

  print "| #{n} "

  #
  # Array
  #

  start = Time.now

  array = Array.new
  1.upto(n) do |i|
    array = Array[i, i, i] + array
  end

  print "| #{Time.now - start} "
  #p array



  #
  # LinkedList
  #

  start = Time.now

  list = LinkedList.new
  1.upto(n) do |i|
    list = LinkedList[i, i, i] + list
  end

  puts "| #{Time.now - start} |"
  #p list

end

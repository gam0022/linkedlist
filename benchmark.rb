require 'linkedlist'
require 'time'

#
# Array
#

start = Time.now

array = Array.new
1.upto(100000) do |i|
  array = Array[i] + array
end

puts "Array#+: #{Time.now - start} sec."
#p array



#
# LinkedList
#

start = Time.now

list = LinkedList.new
1.upto(100000) do |i|
  list = LinkedList[i] + list
end

puts "LinkedList#+: #{Time.now - start} sec."
#p list

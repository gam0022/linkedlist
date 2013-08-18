require 'linkedlist'

p LinkedList.new.to_a

l = LinkedList.new.cons(1).cons(2).cons(3)

p l.to_a
p l.head
p l.tail.to_a

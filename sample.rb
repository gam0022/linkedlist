require 'linkedlist'

p LinkedList.new # => ()

p l1 = LinkedList.new.cons(1).cons(2).cons(3) # => (3, 2, 1)
p l1.head # => 3
p l1.tail # => (2, 1)

p l2 = LinkedList[1, 2, 3, "a", "b"] #=> (1, 2, 3, "a", "b")

p l1.rev_append(l2) #=> (1, 2, 3, 1, 2, 3, "a", "b")
p l1.rev #=> (1, 2, 3)
p l3 = l1.append(l2) #=> (3, 2, 1, 1, 2, 3, "a", "b")

p l3.length # => 8
p LinkedList[].length #=> 0

p l3.nth(0) #=> 3
p l3[7] #=> "b"
p l3[100] #=> nil

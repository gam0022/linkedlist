require 'linkedlist'

def pl(list)
  p list.to_a
end

pl LinkedList.new

l = LinkedList.new.cons(1).cons(2).cons(3)

pl l
p l.head
pl l.tail

l1 = l
l2 = LinkedList.new.cons(3).cons(2).cons(1)

pl l1.rev_append(l2)
pl l.rev
pl l3 = l1.append(l2)

p l3.length
p LinkedList.new.length
p l3.nth(0)
p l3[1]

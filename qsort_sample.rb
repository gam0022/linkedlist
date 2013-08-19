require 'linkedlist'

def divide(a, l, lt, ge)
  if l.empty?
    [lt, ge]
  elsif l.head < a
    divide(a, l.tail, lt.cons(l.head), ge)
  else
    divide(a, l.tail, lt, ge.cons(l.head))
  end
end

def qsort(l)
  if l.empty?
    LinkedList.new
  else 
    lt, ge = divide(l.head, l.tail, LinkedList.new, LinkedList.new)
    qsort(lt) + qsort(ge).cons(l.head)
  end
end

l = LinkedList[3, 5, 8, 1, 4, 7, 10, -3, 2, 100, 43, 10, 50]
p qsort(l) #=> (-3, 1, 2, 3, 4, 5, 7, 8, 10, 10, 43, 50, 100)

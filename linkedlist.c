#include <stdio.h>
#include <ruby.h>

#define true 1
#define false 0

VALUE cLinkedList;

struct linkedlist {
  VALUE value;
  VALUE next;
};

static void
linkedlist_mark(struct linkedlist *ptr)
{
  rb_gc_mark(ptr->value);
}

static VALUE
linkedlist_alloc(VALUE klass)
{
  struct linkedlist *ptr = ALLOC(struct linkedlist);
  return Data_Wrap_Struct(klass, linkedlist_mark, -1, ptr);
}

static VALUE
linkedlist_initialize(VALUE self)
{
  struct linkedlist *ptr;

  Data_Get_Struct(self, struct linkedlist, ptr);
  ptr->value = Qnil;
  ptr->next = Qnil;
  return Qnil;
}

static VALUE
linkedlist_cons(VALUE self, VALUE a)
{
  struct linkedlist *ptr, *new_ptr;
  VALUE new_obj;

  Data_Get_Struct(self, struct linkedlist, ptr);
  new_obj = linkedlist_alloc(cLinkedList);
  Data_Get_Struct(new_obj, struct linkedlist, new_ptr);

  new_ptr->value = a;
  new_ptr->next = self;
  return new_obj;
}

static VALUE
linkedlist_to_a(VALUE self)
{
  struct linkedlist *ptr;
  VALUE ary;
  
  ary = rb_ary_new();
  Data_Get_Struct(self, struct linkedlist, ptr);
  while (ptr->next != Qnil) {
    rb_ary_push(ary, ptr->value);
    Data_Get_Struct(ptr->next, struct linkedlist, ptr);
  }
  return ary;
}

static VALUE
linkedlist_head(VALUE self)
{
  struct linkedlist *ptr;
  Data_Get_Struct(self, struct linkedlist, ptr);
  return ptr->value;
}

static VALUE
linkedlist_tail(VALUE self)
{
  struct linkedlist *ptr;
  Data_Get_Struct(self, struct linkedlist, ptr);
  return ptr->next;
}

void Init_linkedlist(void)
{
  cLinkedList = rb_define_class("LinkedList", rb_cObject);
  rb_define_alloc_func(cLinkedList, linkedlist_alloc);
  rb_define_private_method(cLinkedList, "initialize", linkedlist_initialize, 0);
  rb_define_method(cLinkedList, "cons", linkedlist_cons, 1);
  rb_define_method(cLinkedList, "to_a", linkedlist_to_a, 0);
  rb_define_method(cLinkedList, "head", linkedlist_head, 0);
  rb_define_method(cLinkedList, "tail", linkedlist_tail, 0);
}

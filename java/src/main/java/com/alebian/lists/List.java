package com.alebian.lists;

import java.util.Collection;

public interface List<T> extends Collection<T> {
  boolean addFirst(T element);
  boolean removeFirst();
  boolean removeLast();
  List<T> head();
  List<T> tail();
  T first();
  T last();
}

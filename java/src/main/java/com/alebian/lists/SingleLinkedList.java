package com.alebian.lists;

import java.util.Collection;
import java.util.Iterator;

public class SingleLinkedList<T extends Comparable<T>> implements List<T> {

  private Node<T> first;
  private Node<T> last;
  private int size = 0;

  public SingleLinkedList() {}

  public SingleLinkedList(T element) {
    add(element);
  }

  public SingleLinkedList(List<T> list) {
    for(T element : list) {
      add(element);
    }
  }

  public boolean addFirst(T element) {
    if (element == null) {
      return false;
    }
    Node<T> node = new Node<T>(element, first);
    this.first = node;
    size++;
    return true;
  }

  public boolean removeFirst() {
    if (first == null) {
      return false;
    }
    this.first = first.tail;
    size--;
    if (first == null) {
      this.last = null;
    }
    return true;
  }

  public boolean removeLast() {
    if (first == last) {
      first = last = null;
      size = 0;
    }
    Node<T> current = first;
    while (current != null) {
      if (current.tail == last) {
        current.tail = null;
        last = current;
        size--;
      }
      current = current.tail;
    }
    return false;
  }

  public List<T> head() {
    if (first == null) {
      return this;
    }
    return new SingleLinkedList<T>(first.element);
  }

  public List<T> tail() {
    return null;
  }

  public T first() {
    if (first == null) {
      return null;
    }
    return first.element;
  }

  public T last() {
    if (last == null) {
      return null;
    }
    return last.element;
  }

  public int size() {
    return size;
  }

  public boolean isEmpty() {
    return size == 0;
  }

  public boolean contains(Object object) {
    if (object == null || size == 0) {
      return false;
    }
    T element = (T)object;
    Node<T> current = first;
    while (current != null) {
      if (current.element.equals(element)) {
        return true;
      }
      current = current.tail;
    }
    return false;
  }

  public Iterator<T> iterator() {
    return new SingleLinkedListIterator();
  }

  public Object[] toArray() {
    Object[] array = new Object[size];
    Node<T> current = first;
    for(int i = 0 ; i < size ; i++) {
      array[i] = current.element;
      current = current.tail;
    }
    return array;
  }

  public <T> T[] toArray(T[] a) {
    return null;
  }

  public boolean add(T element) {
    if (element == null) {
      return false;
    }
    if (first == null) {
      first = new Node<T>(element);
      last = first;
    } else {
      Node<T> node = new Node<T>(element);
      last.tail = node;
      last = node;
    }
    size++;
    return true;
  }

  public boolean remove(Object object) {
    if (object == null || size == 0) {
      return false;
    }
    Iterator<T> iterator = iterator();
    while (iterator.hasNext()) {
      if (iterator.next().equals(object)) {
        iterator.remove();
        return true;
      }
    }
    return false;
  }

  public boolean containsAll(Collection<?> c) {
    return false;
  }

  public boolean addAll(Collection<? extends T> c) {
    return false;
  }

  public boolean removeAll(Collection<?> c) {
    return false;
  }

  public boolean retainAll(Collection<?> c) {
    return false;
  }

  public void clear() {

  }

  private class SingleLinkedListIterator implements Iterator<T> {
    Node<T> current = first;
    Node<T> previous = null;
    Node<T> previousPrevious = null;

    public boolean hasNext() {
      if (current == null) {
        return false;
      }
      return true;
    }

    public T next() {
      T element = current.element;
      previousPrevious = previous;
      previous = current;
      current = current.tail;
      return element;
    }

    public void remove() {
      if (previous == null) {
        return;
      }
      if (previousPrevious == null) {
        first = current;
        if (first == null) {
          last = null;
        }
      }
      previousPrevious.tail = current;
      previous = null;
      size--;
    }
  }

  private class Node<T> {
    T element;
    Node<T> tail;

    public Node(T element) {
      this.element = element;
    }

    public Node(T element, Node<T> tail) {
      this.element = element;
      this.tail = tail;
    }
  }
}

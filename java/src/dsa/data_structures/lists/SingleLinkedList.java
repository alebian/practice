package dsa.data_structures.lists;

import dsa.interfaces.Collection;
import dsa.interfaces.List;

import java.util.Comparator;
import java.util.Iterator;

public class SingleLinkedList<E> implements List<E> {
    private final int NULL_INDEX = -1;

    private Node<E> first;
    private Node<E> last;
    private int size = 0;

    public SingleLinkedList() {
    }

    public SingleLinkedList(Collection<? extends E> collection) {
        addAll(collection);
    }

    @Override
    public boolean add(E element) {
        if (element == null) {
            return false;
        }
        if (first == null) {
            first = new Node<E>(element);
            last = first;
        } else {
            Node<E> node = new Node<E>(element);
            last.next = node;
            last = node;
        }
        size++;
        return true;
    }

    @Override
    public boolean add(int index, E element) {
        Node<E> newNode;

        if (!validIndex(index)) {
            return false;
        }
        if (index == 0) {
            newNode = new Node<E>(element, first);
            first = newNode;
            return true;
        }

        int currentIndex = 1;
        Node<E> current, previous;
        current = first.next;
        previous = first;
        while (currentIndex < index) {
            previous = current;
            current = current.next;
            currentIndex++;
        }
        newNode = new Node<E>(element, current);
        previous.next = newNode;
        return true;
    }

    @Override
    public boolean addAll(Collection<? extends E> collection) {
        for (E element : collection) {
            add(element);
        }
        return true;
    }

    @Override
    public int indexOf(E element) {
        int index = 0;
        Node<E> current = first;
        while (current != null) {
            if (current.element.equals(element)) {
                return index;
            }
            index++;
            current = current.next;
        }
        return NULL_INDEX;
    }

    @Override
    public void sort(Comparator<? super E> comparator) {
        // TODO
    }

    @Override
    public List<E> sublist(int fromIndex, int toIndex) {
        List<E> newList = new SingleLinkedList<E>();
        if (!validIndex(fromIndex) || !validIndex(toIndex) || toIndex > fromIndex) {
            return newList;
        }
        int currentIndex = 0;
        Node<E> current = first;
        while (currentIndex < fromIndex) {
            current = current.next;
            currentIndex++;
        }
        while (currentIndex <= toIndex) {
            newList.add(current.element);
            current = current.next;
            currentIndex++;
        }
        return newList;
    }

    @Override
    public E remove(int index) {
        if (!validIndex(index)) {
            return null;
        }
        if (index == 0) {
            E answer = first.element;
            first = first.next;
            return answer;
        }

        int currentIndex = 1;
        Node<E> current;
        current = first.next;
        while (currentIndex < index) {
            current = current.next;
            currentIndex++;
        }
        return current.element;
    }

    @Override
    public boolean remove(E element) {
        Iterator<E> iterator = iterator();
        while (iterator.hasNext()) {
            if (iterator.next().equals(element)) {
                iterator.remove();
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean removeAll(Collection<? extends E> collection) {
        for (E element : collection) {
            remove(element);
        }
        return true;
    }

    @Override
    public void clear() {
        Node<E> current, previous;
        current = first;
        while (current != null) {
            previous = current;
            current = current.next;
            previous.next = null;
        }
        first = null;
        last = null;
    }

    @Override
    public List<E> head() {
        if (first == null) {
            return new SingleLinkedList<E>();
        }
        List<E> newList = new SingleLinkedList<E>();
        newList.add(first.element);
        return newList;
    }

    @Override
    public List<E> tail() {
        if (first == null) {
            return new SingleLinkedList<E>();
        }
        List<E> newList = new SingleLinkedList<E>();
        Node<E> current = first.next;
        while (current != null) {
            newList.add(current.element);
            current = current.next;
        }
        return newList;
    }

    @Override
    public boolean contains(E element) {
        return indexOf(element) != NULL_INDEX;
    }

    @Override
    public boolean containsAll(Collection<? extends E> collection) {
        boolean contains = true;
        for (E element : collection) {
            contains &= indexOf(element) != NULL_INDEX;
        }
        return contains;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    @Override
    public int size() {
        return size;
    }

    private boolean validIndex(int index) {
        return index >= 0 && index < size;
    }

    @Override
    public Iterator<E> iterator() {
        return new SingleLinkedListIterator();
    }

    private class SingleLinkedListIterator implements Iterator<E> {
        Node<E> current = first;
        Node<E> previous = null;
        Node<E> previousPrevious = null;

        public boolean hasNext() {
            if (current == null) {
                return false;
            }
            return true;
        }

        public E next() {
            E element = current.element;
            previousPrevious = previous;
            previous = current;
            current = current.next;
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
            previousPrevious.next = current;
            previous = null;
            size--;
        }
    }

    private class Node<E> {
        E element;
        Node<E> next;

        public Node(E element) {
            this.element = element;
        }

        public Node(E element, Node<E> node) {
            this.element = element;
            this.next = node;
        }
    }
}

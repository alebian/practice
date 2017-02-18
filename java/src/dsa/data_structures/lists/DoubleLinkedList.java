package dsa.data_structures.lists;

import dsa.interfaces.Collection;
import dsa.interfaces.List;

import java.util.Comparator;
import java.util.Iterator;

public class DoubleLinkedList<E> implements List<E> {
    @Override
    public boolean add(E element) {
        return false;
    }

    @Override
    public boolean add(int index, E element) {
        return false;
    }

    @Override
    public boolean addAll(Collection<? extends E> collection) {
        return false;
    }

    @Override
    public int indexOf(E element) {
        return 0;
    }

    @Override
    public void sort(Comparator<? super E> comparator) {

    }

    @Override
    public List<E> sublist(int fromIndex, int toIndex) {
        return null;
    }

    @Override
    public E remove(int index) {
        return null;
    }

    @Override
    public List<E> head() {
        return null;
    }

    @Override
    public List<E> tail() {
        return null;
    }

    @Override
    public void clear() {

    }

    @Override
    public boolean contains(E element) {
        return false;
    }

    @Override
    public boolean containsAll(Collection<? extends E> collection) {
        return false;
    }

    @Override
    public boolean isEmpty() {
        return false;
    }

    @Override
    public boolean remove(E element) {
        return false;
    }

    @Override
    public boolean removeAll(Collection<? extends E> collection) {
        return false;
    }

    @Override
    public int size() {
        return 0;
    }

    @Override
    public Iterator<E> iterator() {
        return null;
    }
}

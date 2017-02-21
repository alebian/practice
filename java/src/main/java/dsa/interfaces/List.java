package dsa.interfaces;

import java.util.Comparator;

public interface List<E> extends Collection<E> {
    boolean add(int index, E element);

    boolean addFirst(E element);

    int indexOf(E element);

    void sort(Comparator<? super E> comparator);

    List<E> sublist(int fromIndex, int toIndex);

    E remove(int index);

    E removeLast();

    E removeFirst();

    List<E> head();

    List<E> tail();

    E get(int index);

    E getFirst();

    E getLast();
}

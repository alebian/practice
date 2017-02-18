package dsa.interfaces;

import java.util.Comparator;

public interface List<E> extends Collection<E> {
    boolean add(int index, E element);

    boolean addAll(Collection<? extends E> collection);

    int indexOf(E element);

    void sort(Comparator<? super E> comparator);

    List<E> sublist(int fromIndex, int toIndex);

    E remove(int index);

    List<E> head();

    List<E> tail();
}

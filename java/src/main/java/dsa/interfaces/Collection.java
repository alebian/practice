package dsa.interfaces;

public interface Collection<E> extends Iterable<E> {
    boolean add(E element);

    boolean addAll(Collection<? extends E> collection);

    void clear();

    boolean contains(E element);

    boolean containsAll(Collection<? extends E> collection);

    boolean isEmpty();

    boolean remove(E element);

    boolean removeAll(Collection<? extends E> collection);

    int size();
}

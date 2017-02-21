package dsa.data_structures.lists;

import dsa.interfaces.List;
import org.junit.Before;
import org.junit.Test;

import java.util.LinkedList;

import static org.junit.Assert.assertEquals;

public class SingleLinkedListTest {
    List<Integer> list;
    List<Integer> otherList;
    static final Integer ONE = 1;
    static final Integer TWO = 2;
    static final Integer THREE = 3;

    @Before
    public void setUp() {
        list = new SingleLinkedList<Integer>();
        otherList = new SingleLinkedList<>();
        otherList.add(ONE);
        otherList.add(TWO);
    }

    @Test
    public void testAdd() {
        assertEquals(0, list.size());
        list.add(ONE);
        assertEquals(1, list.size());
        assertEquals(ONE, list.getFirst());
        list.add(TWO);
        assertEquals(2, list.size());
        assertEquals(ONE, list.getFirst());
        assertEquals(TWO, list.getLast());
    }

    @Test
    public void testAddFirst() {
        list.addFirst(ONE);
        assertEquals(ONE, list.getFirst());
        assertEquals(1, list.size());
        list.addFirst(TWO);
        assertEquals(2, list.size());
        assertEquals(TWO, list.getFirst());
    }

    @Test
    public void testAddAll() {
        list.addAll(otherList);
        assertEquals(ONE, list.getFirst());
        assertEquals(TWO, list.getLast());
    }

    @Test
    public void testIndexOf() {
        list.add(ONE);
        list.add(TWO);
        list.add(THREE);
        assertEquals(0, list.indexOf(ONE));
        assertEquals(1, list.indexOf(TWO));
        assertEquals(2, list.indexOf(THREE));
    }

    @Test
    public void testSort() {
        // TODO
    }

    @Test
    public void testSubList() {
        list.add(ONE);
        list.add(TWO);
        list.add(THREE);
        list.add(ONE);
        List<Integer> newList = list.sublist(1, 2);
        assertEquals(2, newList.size());
        assertEquals(TWO, newList.getFirst());
        assertEquals(THREE, newList.getLast());
        newList = list.sublist(1, 1);
        assertEquals(1, newList.size());
        assertEquals(TWO, newList.getFirst());
    }

    @Test
    public void testRemove() {
        list.add(ONE);
        list.add(TWO);
        list.add(THREE);
        list.remove(THREE);
        assertEquals(2, list.size());
        assertEquals(ONE, list.getFirst());
        list.remove(1);
        assertEquals(1, list.size());
        assertEquals(ONE, list.getFirst());
    }

    @Test
    public void testRemoveFirst() {
        list.add(ONE);
        list.add(TWO);
        list.removeFirst();
        assertEquals(1, list.size());
        assertEquals(TWO, list.getFirst());
        list.removeFirst();
        assertEquals(0, list.size());
        assertEquals(null, list.getFirst());
    }

    @Test
    public void testRemoveLast() {
        list.add(ONE);
        list.add(TWO);
        assertEquals(TWO, list.getLast());
        list.removeLast();
        assertEquals(1, list.size());
        assertEquals(ONE, list.getFirst());
        assertEquals(ONE, list.getLast());
        list.removeLast();
        assertEquals(0, list.size());
        assertEquals(null, list.getFirst());
        assertEquals(null, list.getLast());
    }

    @Test
    public void testHead() {
        list.add(TWO);
        list.add(ONE);
        List<Integer> newList = list.head();
        assertEquals(1, newList.size());
        assertEquals(TWO, newList.getFirst());
    }

    @Test
    public void testTail() {
        list.add(TWO);
        list.add(ONE);
        List<Integer> newList = list.tail();
        assertEquals(1, newList.size());
        assertEquals(ONE, newList.getFirst());
    }

    @Test
    public void testGet() {
        list.add(ONE);
        list.add(TWO);
        list.add(THREE);
        assertEquals(ONE, list.get(0));
        assertEquals(TWO, list.get(1));
        assertEquals(THREE, list.get(2));
    }

    @Test
    public void testGetFirst() {
        assertEquals(null, list.getFirst());
        list.add(ONE);
        assertEquals(ONE, list.getFirst());
        list.add(3);
        assertEquals(ONE, list.getFirst());
        list.addFirst(TWO);
        assertEquals(TWO, list.getFirst());
    }

    @Test
    public void testGetLast() {
        assertEquals(null, list.getLast());
        list.add(ONE);
        assertEquals(ONE, list.getLast());
        list.add(THREE);
        assertEquals(THREE, list.getLast());
        list.addFirst(TWO);
        assertEquals(THREE, list.getLast());
    }

    @Test
    public void testClear() {
        list.add(ONE);
        list.add(TWO);
        list.add(THREE);
        assertEquals(3, list.size());
        list.clear();
        assertEquals(0, list.size());
        assertEquals(null, list.getFirst());
    }

    @Test
    public void testSize() {
        assertEquals(0, list.size());
        Integer i = 1;
        while (i <= 1000) {
            list.add(i);
            assertEquals(i, new Integer(list.size()));
            i++;
        }
    }

    @Test
    public void testIsEmpty() {
        assertEquals(true, list.isEmpty());
        list.add(ONE);
        assertEquals(false, list.isEmpty());
        list.removeFirst();
        assertEquals(true, list.isEmpty());
    }

    @Test
    public void testContains() {
        assertEquals(false, list.contains(ONE));
        assertEquals(false, list.contains(TWO));
        assertEquals(false, list.contains(THREE));
        list.add(ONE);
        list.add(TWO);
        list.addFirst(THREE);
        assertEquals(true, list.contains(ONE));
        assertEquals(true, list.contains(TWO));
        assertEquals(true, list.contains(THREE));
    }

    @Test
    public void testContainsAll() {
        list.add(ONE);
        list.add(TWO);
        list.add(THREE);
        assertEquals(true, list.containsAll(otherList));
    }

    @Test
    public void testRemoveAll() {
        list.add(ONE);
        list.add(TWO);
        list.add(THREE);
        assertEquals(true, list.removeAll(otherList));
        assertEquals(1, list.size());
        assertEquals(THREE, list.getFirst());
    }
}

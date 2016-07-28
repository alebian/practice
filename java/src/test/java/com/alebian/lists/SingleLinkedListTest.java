package com.alebian.lists;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class SingleLinkedListTest {

  List<Integer> list;
  static final Integer ONE = 1;
  static final Integer TWO = 2;
  static final Integer THREE = 3;

  @Before
  public void setUp() {
    list = new SingleLinkedList<Integer>();
  }

  @Test
  public void testAddFirst() {
    list.addFirst(ONE);
    assertEquals(ONE, list.first());
    assertEquals(1, list.size());
    list.addFirst(TWO);
    assertEquals(2, list.size());
    assertEquals(TWO, list.first());
  }

  @Test
  public void testRemoveFirst() {
    list.add(ONE);
    list.add(TWO);
    list.removeFirst();
    assertEquals(1, list.size());
    assertEquals(TWO, list.first());
  }

  @Test
  public void testRemoveLast() {
    list.add(ONE);
    list.add(TWO);
    assertEquals(TWO, list.last());
    list.removeLast();
    assertEquals(1, list.size());
    assertEquals(ONE, list.first());
    assertEquals(ONE, list.last());
    list.removeLast();
    assertEquals(0, list.size());
    assertEquals(null, list.first());
    assertEquals(null, list.last());
  }

  @Test
  public void testHead() {
    list.add(TWO);
    list.add(ONE);
    List<Integer> newList = list.head();
    assertEquals(1, newList.size());
    assertEquals(TWO, newList.first());
  }

  @Test
  public void testTail() {

  }

  @Test
  public void testFirst() {
    assertEquals(null, list.first());
    list.add(ONE);
    assertEquals(ONE, list.first());
    list.add(3);
    assertEquals(ONE, list.first());
    list.addFirst(TWO);
    assertEquals(TWO, list.first());
  }

  @Test
  public void testLast() {
    assertEquals(null, list.last());
    list.add(ONE);
    assertEquals(ONE, list.last());
    list.add(THREE);
    assertEquals(THREE, list.last());
    list.addFirst(TWO);
    assertEquals(THREE, list.last());
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
  public void testAdd() {
    assertEquals(0, list.size());
    list.add(ONE);
    assertEquals(1, list.size());
    assertEquals(ONE, list.first());
    list.add(TWO);
    assertEquals(2, list.size());
    assertEquals(ONE, list.first());
    assertEquals(TWO, list.last());
  }

}

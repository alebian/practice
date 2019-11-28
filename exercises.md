## Strings

### Permutations of string A in string B (B is bigger than A)

Given a smaller strings and a bigger string b, design an algorithm to find all permutations of the shorter string within the longer one. Print the location of each permutation.

#### O(N * M) solution

```java
public class Main {
    public static void main(String[] args) {
        String s = "abbc";
        String b = "cbabadcbbabbcbabaabccbabc";

        List<Integer> indexes = findPermutationIndexes(s, b);
        System.out.println(indexes);
    }

    private static List<Integer> findPermutationIndexes(String s, String b) {
        Map<Character, Integer> hashes = initializeCharacterHashes();
        int sHash = calculateStringHash(s, hashes);
        List<Integer> result = new ArrayList<>();

        for (int i = 0; i < b.length() - s.length() + 1; i++) {
            String sub = b.substring(i, i + s.length());
            int hash = calculateStringHash(sub, hashes);
            if (hash == sHash) {
                result.add(i);
            }
        }

        return result;
    }

    private static int calculateStringHash(String s, Map<Character, Integer> hashes) {
        int result = 1;
        for (int i = 0; i < s.length(); i++) {
          result *= hashes.get(s.charAt(i));
        }
        return result;
    }

    private static Map<Character, Integer> initializeCharacterHashes() {
        Map<Character, Integer> hashes = new HashMap<Character, Integer>();
        hashes.put('a', 2);
        hashes.put('b', 3);
        hashes.put('c', 5);
        hashes.put('d', 7);
        hashes.put('e', 11);
        hashes.put('f', 13);
        hashes.put('g', 17);
        hashes.put('h', 19);
        hashes.put('i', 23);
        hashes.put('j', 29);
        hashes.put('k', 31);
        hashes.put('l', 37);
        hashes.put('m', 41);
        hashes.put('n', 43);
        hashes.put('o', 47);
        hashes.put('p', 53);
        hashes.put('q', 59);
        hashes.put('r', 61);
        hashes.put('s', 67);
        hashes.put('t', 71);
        hashes.put('u', 73);
        hashes.put('v', 79);
        hashes.put('w', 83);
        hashes.put('x', 89);
        hashes.put('y', 97);
        hashes.put('z', 101);
        return hashes;
    }
}
```

#### O(N) solution

This solution is significantly harder than the `O(N * M)` or `O(N * M log M)` solutions, and should have a bit of explanation.
The idea here is to manipulate the characters as numbers and use xor to manipulate the bits, more specifically, use the idea of a one time pad encryption technique. First we take all the caracters of the smaller string and xor them all, creating our encryption key. Then we make a windowed iteration of the bigger string, and xor every element of the window to create a key and see if they are the same. It's important that we don't re-calculate the key everytime we move the window because that would make our algorithm `O(N * M)`. We have to xor each element to the constructed key, and before moving the window, xor the first element (the one that will be out of the window next) to the constructed key.

```java
public class Main {
    public static void main(String[] args) {
        String s = "abbc";

        String b = "cbabadcbbabbcbabaabccbabc";

        List<Integer> result = new ArrayList<Integer>();

        int key = charToInt(s.charAt(0));
        for (int i = 1; i < s.length(); i++) {
            key = xor(key, charToInt(s.charAt(i)));
        }

        int cipher = 0;
        int idx = 0;
        for (int i = 0; i < b.length(); i++) {
            cipher = xor(cipher, charToInt(b.charAt(i)));
            if (i - idx == s.length() - 1) {
                if (xor(cipher, key) == 0) {
                    result.add(idx);
                }
                cipher = xor(cipher, charToInt(b.charAt(idx)));
                idx++;
            }
        }

        System.out.println(result);
    }

    private static int xor(int i, int j) {
        return i ^ j;
    }

    private static int charToInt(Character c) {
        return (int) c;
    }
}
```

## Linked lists

### Sort a linked list

#### O(N log N) solution

```java
class Solution {
    public ListNode sortList(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }

        ListNode mid = findMiddleAndSplit(head);
        ListNode left = sortList(head);
        ListNode right = sortList(mid);
        ListNode ret = merge(left, right);
        return ret;
    }

    private ListNode findMiddleAndSplit(ListNode node) {
        ListNode slow, fast, preSlow = null;
        slow = fast = node;
        while (fast != null && fast.next != null) {
            preSlow = slow;
            slow = slow.next;
            fast = fast.next.next;
        }
        
        preSlow.next = null;
        return slow;
    }

    private ListNode merge(ListNode left, ListNode right) {
        ListNode dummyHead = new ListNode(0);
        ListNode current = dummyHead;

        while (left != null && right != null) {
            if (left.val <= right.val) {
                current.next = left;
                left = left.next;
            } else {
                current.next = right;
                right = right.next;
            }
            current = current.next;
        }

        curr.next = (left != null) ? left : right;
        return dummyHead.next;
    }
}
```

## Merge sort like indexes

This piece of code will return for the first run:

`0, 2, 4, 6, 8, ...`

Second run:

`0, 4, 8, ...`

Third run:

`0, 8, ...`

```java
int interval = 1;
while (interval < length) {
    for (int i = 0; i + interval < length; i = i + interval * 2) {
        doSomething()
    }
    interval *= 2;
}
```

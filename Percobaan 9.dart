 import 'dart:collection';
import 'dart:io';

//Percobaan 1
class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  BinaryTree() {
    root = null;
  }

  //Percobaan 2 InOrder
   void printInOrder(Node<T>? node) {
    if (node != null) {
      printInOrder(node.left); // L (left)
      stdout.write("${node.nodeValue} "); // N (node/root)
      printInOrder(node.right); // R (right)
    }
  }

  void printInOrderFromRoot() {
    printInOrder(root);
  }

  //Percobaan 3
  void printPreOrder(Node<T>? node) {
    if (node != null) {
      stdout.write("${node.nodeValue} "); // N (node/root)
      printPreOrder(node.left); // L (left)
      printPreOrder(node.right); // R (right)
    }
  }

  void printPreOrderFromRoot() {
    printPreOrder(root);
  }

  //Percobaan 4
  void printPostOrder(Node<T>? node) {
    if (node != null) {
      printPostOrder(node.left); // L (left)
      printPostOrder(node.right); // R (right)
      stdout.write("${node.nodeValue} "); // N (node/root)
    }
  }

  void printPostOrderFromRoot() {
    printPostOrder(root); // Memperbaiki pemanggilan fungsi yang salah
  }



//Percobaan 5
 int maxDepth(Node? node) {
    if (node == null) {
      return 0;
    } else {
      int lDepth = maxDepth(node.left);
      int rDepth = maxDepth(node.right);
      return lDepth > rDepth ? lDepth + 1 : rDepth + 1;
    }
  }


//Percobaan 6
void printLevelOrder() {
    int h = tinggi(root);
    for (int i = 0; i <= h; i++) {
      printCurrentLevel(root, i);
    }
  }

  int tinggi(Node? root) {
    if (root == null) {
      return 0;
    } else {
      int ltinggi = tinggi(root.left);
      int rtinggi = tinggi(root.right);
      return ltinggi > rtinggi ? ltinggi + 1 : rtinggi + 1;
    }
  }

  void printCurrentLevel(Node? root, int level) {
    if (root != null) {
      if (level == 0) {
        print('${root.nodeValue}');
      } else if (level >= 1) {
        printCurrentLevel(root.left, level - 1);
        printCurrentLevel(root.right, level - 1);
      }
    }
  }

  //Percobaan 7
 void deleteDeepest(Node<T>? root, Node<T> deleteNode) {
    if (root == null) return;
    List<Node<T>> queue = [];
    queue.add(root);
    while (queue.isNotEmpty) {
      Node<T> temp = queue.removeAt(0);
      if (temp.left != null) {
        if (temp.left == deleteNode) {
          temp.left = null;
          return;
        } else {
          queue.add(temp.left!);
        }
      }
      if (temp.right != null) {
        if (temp.right == deleteNode) {
          temp.right = null;
          return;
        } else {
          queue.add(temp.right!);
        }
      }
    }
  }

  void delete(T key) {
    if (root == null) return;
    if (root!.left == null && root!.right == null) {
      if (root!.nodeValue == key) {
        root = null;
      }
      return;
    }
    List<Node<T>> queue = [];
    queue.add(root!);
    Node<T>? temp;
    Node<T>? keyNode;
    
    //Cari node dengan key yang ingin dihapus & Ganti dengan node terdalam
    while (queue.isNotEmpty) {
      temp = queue.removeAt(0);
      
      if (temp.nodeValue == key) {
        keyNode = temp;
      }
      if (temp.left != null) {
        queue.add(temp.left!);
      }
      if (temp.right != null) {
        queue.add(temp.right!);
      }
    }
    if (keyNode != null && temp != null) {
      keyNode.nodeValue = temp.nodeValue;
      deleteDeepest(root, temp);
    }
  }
}




//VOID MAIN

 void main() {
  BinaryTree t = BinaryTree();
  t.root = Node<int>(10);
  t.root!.left = Node<int>(20);
  t.root!.right = Node<int>(30);
  t.root!.right!.left = Node<int>(4);
  
  print("In Order traversal of binary tree is:");
  t.printInOrderFromRoot();
  print("");

  print("Pre Order traversal of binary tree is:");
  t.printPreOrderFromRoot();
  print("");

  print("Post Order traversal of binary tree is:");
  t.printPostOrderFromRoot();
  print("");

  print("Height of Binary Tree: ${t.maxDepth(t.root)}");
  print("");

  
  t.delete(20);
  print("In Order traversal of binary tree after deletion is:");
  t.printInOrderFromRoot();
  print("");

  print("Nilai pada Level Tertentu pada Binary Tree (Level 1): ");
  t.printCurrentLevel(t.root, 1);
  print("");
}
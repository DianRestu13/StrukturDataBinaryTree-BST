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
  void printPostOrder(Node<T>? node) {
    if (node != null) {
      printPostOrder(node.left); // L (left)
      printPostOrder(node.right); // R (right)
      stdout.write("${node.nodeValue} "); // N (node/root)
    }
  }

  void printPostOrderFromRoot() {
    printPostOrder(root);
  }
}

void main() {
  // Membangun Binary Tree untuk notasi aritmatika a * b + (c - d) / e
  BinaryTree<String> tree = BinaryTree<String>();
  tree.root = Node<String>('+');
  tree.root!.left = Node<String>('*');
  tree.root!.right = Node<String>('/');
  tree.root!.left!.left = Node<String>('a');
  tree.root!.left!.right = Node<String>('b');
  tree.root!.right!.left = Node<String>('-');
  tree.root!.right!.right = Node<String>('e');
  tree.root!.right!.left!.left = Node<String>('c');
  tree.root!.right!.left!.right = Node<String>('d');

  // Menghitung dan mencetak hasil PostOrder traversal
  print("PostOrder traversal: ");
  tree.printPostOrderFromRoot();
}
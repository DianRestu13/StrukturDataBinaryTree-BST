class Node<T extends Comparable<T>> {
  T value;
  Node<T>? left, right;

  Node(this.value);
}

class BinarySearchTree<T extends Comparable<T>> {
  Node<T>? root;

  void insert(T value) {
    root = _insertRec(root, value);
  }

  Node<T>? _insertRec(Node<T>? node, T value) {
    if (node == null) return Node(value);

    if (value.compareTo(node.value) < 0) {
      node.left = _insertRec(node.left, value);
    } else if (value.compareTo(node.value) > 0) {
      node.right = _insertRec(node.right, value);
    }

    return node;
  }

  void inOrderTraversal(Node<T>? node) {
    if (node != null) {
      inOrderTraversal(node.left);
      print('${node.value}');
      inOrderTraversal(node.right);
    }
  }

  void printInOrder() {
    inOrderTraversal(root);
  }
}

void main() {
  BinarySearchTree<num> bst = BinarySearchTree<num>();

  List<int> nodes = [30, 15, 17, 36, 67, 30, 69];
  for (var node in nodes) {
    bst.insert(node);
  }

  print("In Order traversal of Binary Search Tree is:");
  bst.printInOrder(); // Output: 15, 17, 30, 36, 67, 69
}
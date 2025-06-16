class Node<T> {   
  T nodeValue;              // untuk menyimpan nilai node
  Node<T>? left, right;     // Pointer ke anak kiri dan kanan
   
  // Constructor untuk membuat node baru
  Node(this.nodeValue); 
}

// Definisi class BinaryTree untuk mengelola struktur binary tree
class BinaryTree<T> {   
  Node<T>? root;    // Root node dari tree
   
  // Constructor untuk inisialisasi binary tree kosong
  BinaryTree() {     
    root = null;   // Set root sebagai null (tree kosong)
  }
   
  // Method untuk In-Order Traversal (Kiri - Root - Kanan)
  void printInOrder(Node<T>? node, List<T> result) {     
    if (node != null) {       // jika node tidak null
      printInOrder(node.left, result);    // Rekursi ke subtree kiri
      result.add(node.nodeValue);          // Kunjungi root (tambahkan ke result)
      printInOrder(node.right, result);    // Rekursi ke subtree kanan
    }   
  }
   
  // Method untuk memulai In-Order traversal dari root
  void printInOrderFromRoot() {     
    List<T> result = [];          // List untuk menyimpan hasil traversal
    printInOrder(root, result);   // Panggil method rekursif dari root
    print(result.join(' '));     // Print hasil
  }
   
  // Method untuk Pre-Order Traversal (Root - Kiri -Kanan)
  void printPreOrder(Node<T>? node, List<T> result) {     
    if (node != null) {       //jika node tidak null
      result.add(node.nodeValue);          // Kunjungi root terlebih dahulu
      printPreOrder(node.left, result);    // Rekursi ke subtree kiri
      printPreOrder(node.right, result);   // Rekursi ke subtree kanan
    }   
  }
   
  // Method untuk memulai Pre-Order traversal dari root
  void printPreOrderFromRoot() {     
    List<T> result = [];           // List untuk menyimpan hasil traversal
    printPreOrder(root, result);   // Panggil method rekursif dari root
    print(result.join(' '));      // Print hasil
  }
   
  // Method untuk Post-Order Traversal (Kiri - Kanan - Root)
  void printPostOrder(Node<T>? node, List<T> result) {     
    if (node != null) {       // jika node tidak null
      printPostOrder(node.left, result);   // Rekursi ke subtree kiri
      printPostOrder(node.right, result);  // Rekursi ke subtree kanan
      result.add(node.nodeValue);          // Kunjungi root terakhir
    }   
  }
   
  // Method untuk memulai Post-Order traversal dari root
  void printPostOrderFromRoot() {     
    List<T> result = [];            // List untuk menyimpan hasil traversal
    printPostOrder(root, result);   // Panggil method rekursif dari root
    print(result.join(' '));       // Print hasil
  } 
}

void main() {
  // Studi Kasus 1: a * b + (c - d) / e
  BinaryTree<String> tree1 = BinaryTree<String>();
  tree1.root = Node<String>('+');
  tree1.root!.left = Node<String>('*');
  tree1.root!.right = Node<String>('/');
  tree1.root!.left!.left = Node<String>('a');
  tree1.root!.left!.right = Node<String>('b');
  tree1.root!.right!.left = Node<String>('-');
  tree1.root!.right!.right = Node<String>('e');
  tree1.root!.right!.left!.left = Node<String>('c');
  tree1.root!.right!.left!.right = Node<String>('d');

  print("Studi Kasus 1 - In Order traversal: ");
  tree1.printInOrderFromRoot();
  
  print("Studi Kasus 1 - Pre Order traversal: ");
  tree1.printPreOrderFromRoot();

  print("Studi Kasus 1 - Post Order traversal: ");
  tree1.printPostOrderFromRoot();

  // Studi Kasus 2: (A + B) * (C - D)
  BinaryTree<String> tree2 = BinaryTree<String>();
  tree2.root = Node<String>('*');
  tree2.root!.left = Node<String>('+');
  tree2.root!.right = Node<String>('-');
  tree2.root!.left!.left = Node<String>('A');
  tree2.root!.left!.right = Node<String>('B');
  tree2.root!.right!.left = Node<String>('C');
  tree2.root!.right!.right = Node<String>('D');

  print("Studi Kasus 2 - In Order traversal: ");
  tree2.printInOrderFromRoot();
  
  print("Studi Kasus 2 - Pre Order traversal: ");
  tree2.printPreOrderFromRoot();

  print("Studi Kasus 2 - Post Order traversal: ");
  tree2.printPostOrderFromRoot();

  // Studi Kasus 3: A + (B - C) / D * E
  BinaryTree<String> tree3 = BinaryTree<String>();
  tree3.root = Node<String>('+');
  tree3.root!.left = Node<String>('A');
  tree3.root!.right = Node<String>('*');
  tree3.root!.right!.left = Node<String>('/');
  tree3.root!.right!.right = Node<String>('E');
  tree3.root!.right!.left!.left = Node<String>('-');
  tree3.root!.right!.left!.left!.left = Node<String>('B');
  tree3.root!.right!.left!.left!.right = Node<String>('C');
  tree3.root!.right!.left!.right = Node<String>('D');

  print("Studi Kasus 3 - In Order traversal: ");
  tree3.printInOrderFromRoot();
  
  print("Studi Kasus 3 - Pre Order traversal: ");
  tree3.printPreOrderFromRoot();

  print("Studi Kasus 3 - Post Order traversal: ");
  tree3.printPostOrderFromRoot();
} 
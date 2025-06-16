class STNode<T> {
  T nodeValue; // Nilai dari node
  STNode<T>? left, right, parent; // Referensi ke anak kiri, anak kanan, dan parent

  // Konstruktor untuk inisialisasi node
  STNode(this.nodeValue, [this.parent]) {
    left = null; // Inisialisasi anak kiri sebagai null
    right = null; // Inisialisasi anak kanan sebagai null
  }
}

class BinarySearchTree<T extends Comparable> {
  STNode<T>? root; // Referensi ke root
  int treeSize = 0; // Menyimpan ukuran tree

  // Konstruktor untuk inisialisasi tree
  BinarySearchTree() {
    root = null; // Memulai dengan root kosong
  }

  // Method untuk menambahkan node baru ke dalam tree
  bool add(T item) {
    STNode<T>? t = root, parent;
    while (t != null) {
      parent = t; // Menyimpan parent saat ini
      int orderValue = item.compareTo(t.nodeValue); // Membandingkan nilai
      if (orderValue == 0) {
        return false; // Node sudah ada
      } else if (orderValue < 0) {
        t = t.left; // Bergerak ke anak kiri
      } else {
        t = t.right; // Bergerak ke anak kanan
      }
    }
    STNode<T> newNode = STNode(item, parent); // Membuat node baru
    if (parent == null) {
      root = newNode; // Jika tree kosong, node baru menjadi root
    } else if (item.compareTo(parent.nodeValue) < 0) {
      parent.left = newNode; // Menambahkan node baru sebagai anak kiri
    } else {
      parent.right = newNode; // Menambahkan node baru sebagai anak kanan
    }
    treeSize++; // Menambah ukuran tree
    return true; // Node berhasil ditambahkan
  }

  // Method untuk mendapatkan nilai terkecil di dalam tree
  T? first() {
    if (root == null) {
      return null; // Jika tree kosong, kembalikan null
    }
    STNode<T>? current = root;
    while (current!.left != null) {
      current = current.left; // Menelusuri ke node paling kiri
    }
    return current.nodeValue; // Mengembalikan nilai dari node paling kiri
  }
}

void main() {
  BinarySearchTree<int> bst = BinarySearchTree<int>();
  bst.add(35); // Menambahkan node dengan nilai 35
  bst.add(18); // Menambahkan node dengan nilai 18
  bst.add(25); // Menambahkan node dengan nilai 25
  bst.add(48); // Menambahkan node dengan nilai 48
  bst.add(20); // Menambahkan node dengan nilai 20

  int? smallestValue = bst.first(); // Mendapatkan nilai terkecil
  print('Nilai terkecil di dalam Binary Search Tree: $smallestValue'); // Menampilkan nilai terkecil
}
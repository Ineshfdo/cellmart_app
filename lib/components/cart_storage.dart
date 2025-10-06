class CartStorage {
  static List<Map<String, String>> cartItems = [];

  static void addItem(Map<String, String> item) {
    cartItems.add(item);
  }

  static void clearCart() {
    cartItems.clear();
  }
}

class FavouriteHandler {
  static List myFav = [];
  static List myCart = [];

  static String calculateTotal() {
    double totalPrice = 00;
    for (int i = 0; i < myCart.length; i++) {
      totalPrice += myCart[i].quePrice!;
    }
    return totalPrice.toStringAsFixed(2);
  }
}

class FirebaseCollection {
  static const String users = 'users';
  static const String UsersData = "usersAccountData";
  static const String clients = 'clients';
  static const String categories = 'categories';
  static const String products = 'products';
  static   String productPath(String categoryId) => '$categories/$categoryId/$products';
}
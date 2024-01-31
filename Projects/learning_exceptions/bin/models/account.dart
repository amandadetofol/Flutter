class Account {
  String name;
  double balance;
  bool isAuthenticated;
  DateTime? createdAt;

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated,
      this.createdAt}):
      assert(name.isNotEmpty, "Name must be filled");

  editBalance({required value}) {
    balance = balance + value;
  }
}

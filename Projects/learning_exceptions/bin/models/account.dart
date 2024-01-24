class Account {
  String name;
  double balance;
  bool isAuthenticated;

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated}):
      assert(name.isNotEmpty, "Name must be filled");

  editBalance({required value}) {
    balance = balance + value;
  }
}

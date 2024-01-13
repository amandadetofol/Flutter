class UserModel {
 
  final String name; 
  final String password;

  UserModel(
    this.name, 
    this.password);

  static bool isValidPassword(String password){
    return password.length >= 8;
  }

  bool matchesPassword(String password){
    return password == this.password;
  }

}
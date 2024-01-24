final class InvalidSenderAccountIdException implements Exception { 

  String report = "InvalidSenderAccountIdException";
  String senderId; 

  InvalidSenderAccountIdException({required this.senderId});

  @override 
  String toString(){
    return "$report\nSenderId: $senderId";
  }

}

final class InvalidReceiverAccountIdException implements Exception { 

  String report = "InvalidReceiverAccountIdException";
  String receiverId; 

  InvalidReceiverAccountIdException({required this.receiverId});

  @override 
  String toString(){
    return "$report\Receiver: $receiverId";
  }

}

final class InvalidSenderAmountException implements Exception { 

  String report = "InvalidSenderAmountException";
  double transferAmount;
  double currentBalance; 

  InvalidSenderAmountException(
    {required this.transferAmount, 
    required this.currentBalance});

  @override 
  String toString(){
    return "$report\nTransferAmount: $transferAmount\nCurrentBalance: $currentBalance";
  }

}

final class NotAuthenticatedException implements Exception {

  String report = "NotAuthenticatedException";
  String user; 

  NotAuthenticatedException({required this.user});

  @override 
  String toString(){
    return "$report\nUser: $user";
  }

 }
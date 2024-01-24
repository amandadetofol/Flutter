import '../models/account.dart';
import '../exception/bank_controller_exceptions.dart';

class BankController {
  final Map<String, Account> _database = {};

  addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  bool makeTransfer(
      {required String idSender,
      required String idReceiver,
      required double amount}) {
   
    if (!verifyId(idSender)) {
      throw InvalidSenderAccountIdException(senderId: idSender);
    }

    if (!verifyId(idReceiver)) {
      throw InvalidReceiverAccountIdException(receiverId: idReceiver);
    }

    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    if (!accountSender.isAuthenticated) {
      throw NotAuthenticatedException(user: accountSender.name);
    }

    if (accountSender.balance < amount) {
      throw InvalidSenderAmountException(
        transferAmount: amount,
        currentBalance: accountSender.balance);
    }

    // Se tudo estiver certo, efetivar transação
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}

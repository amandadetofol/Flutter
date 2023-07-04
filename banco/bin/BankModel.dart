import 'OperationModel.dart';
import 'UserModel.dart';

enum BankAcctountType { 
  current, 
  savings
}

extension BankAccountTypeExtension on BankAcctountType {

  String get description {
    switch (this) {
      case BankAcctountType.current: 
        return "Conta Corrente";

      case BankAcctountType.savings:
        return "Conta Poupança";
    }
  }
}

class BankAcctountModel {
  
  final UserModel user;
  final BankAcctountType type; 
  double balance; 
  List<OperationModel> operationsHistory = [];

  BankAcctountModel(this.user, this.type, this.balance);

  void deposit(double value, String password){
    if (!user.matchesPassword(password)){
      print("Senha inválida");
      return;
    }

    this.balance += value;
    operationsHistory.add(OperationModel("Depósito", value));
    print("");
    print("------------------------------------------");
    print("Depósito realizado com sucesso!");
    print("Novo saldo: ${this.balance}");
    print("------------------------------------------");
    print("");
  }

  void withdraw(double value, String password){
    if (!user.matchesPassword(password)){
      print("Senha inválida");
      return;
    }

    this.balance -= value;
    operationsHistory.add(OperationModel("Saque", value));
    print("");
    print("------------------------------------------");
    print("Saque realizado com sucesso!");
    print("Novo saldo: ${this.balance}");
    print("------------------------------------------");
    print("");
  }

  void getBankAccountInformations(String password){
    if (!user.matchesPassword(password)){
      print("Senha inválida");
      return;
    }

    print("");
    print("------------------------------------------");
    print("Olá! ${user.name} :) ");
    print("Seu saldo é: ${this.balance}");
    print("Sua conta é do tipo ${this.type.description}");
    print("------------------------------------------");
    print("");
    operationsHistory.add(OperationModel("Ver informações da minha conta bancária", 0));
  }

  void getHistory(String password){
    if (!user.matchesPassword(password)){
      print("Senha inválida");
      return;
    }
    
    print("");
    print("------------------------------------------");
    print("Seu histórico de transações!");  
    operationsHistory.forEach((operation) {
      print("${operation.name} | Valor: ${operation.value}");
    });
    print("------------------------------------------");
    print("");
  }

  void incomePreview(int deadline, String password){
    if (!user.matchesPassword(password)){
      print("Senha inválida");
      return;
    }

    print("");
    print("------------------------------------------");
    if (deadline >= 24){
      print("Erro: Prévia de rendimento com prazo maior do que 24 meses."); 
      operationsHistory.add(OperationModel("Erro: Prévia de rendimento com prazo maior do que 24 meses.", 0));
    } else {
      final double amount = _calculateIncome(deadline);
      print("Prévia de rendimento com prazo de ${deadline} meses: ${amount}"); 
      operationsHistory.add(OperationModel("Prévia de rendimento com prazo: ${deadline}", amount));
    }
    print("------------------------------------------");
    print("");
  }

  void makeNewTransferFor(String name, double value, String password){
    if (!user.matchesPassword(password)){
      print("Senha inválida");
      return;
    }

    this.balance -= value;
    operationsHistory.add(OperationModel("Transferencia para ${name}", value));
    print("");
    print("------------------------------------------");
    print("Transferencia para ${name} realizado com sucesso!");
    print("Novo saldo: ${this.balance}");
    print("------------------------------------------");
    print("");
  }

  double _calculateIncome(int deadline){
    return ((balance * 0.20) * deadline);
  }

}
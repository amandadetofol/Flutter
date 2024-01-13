/*
Banco
Crie uma aplicação simples de banco.

O usuário deve inserir um nome e uma senha de 8 dígitos.
O usuário deve escolher entre conta poupança ou corrente.
A conta deve ser criada automaticamente e os dados devem ser exibidos.
Faça um menu interativo onde:
Ao digitar 1, o usuário possa depositar um valor.
Ao digitar 2, o usuário pode sacar um valor.
Ao digitar 3, o usuário pode exibir o saldo e os dados da sua conta.
Ao digitar 4, o usuário pode ver o extrato, contendo o histórico de transações.
Ao digitar 5:
Se a conta for poupança, deve ser exibido uma prévia de rendimento.
O dinheiro na conta deve render 2% ao mês.
O usuário deve enviar quantos meses ele deseja consultar, não podendo exceder 24 meses.
Se a conta for corrente, deve ser possível fazer uma transferência.
O usuário deve inserir um nome(Fictício, como se fosse um pix por Nome).
O usuário deve inserir o valor a ser transferido.
Ao digitar 0, o aplicativo é fechado, deve ser confirmado antes de fechar.

Antes de concluir cada operação, a senha deve ser confirmada.

Requisitos técnicos
Estruture seus Models aproveitando os pilares de POO.
*/

import 'dart:io';
import 'BankModel.dart';
import 'UserModel.dart';

UserModel? createUser(){
  print("Seja Bem-Vindo a sua Conta Bancária!");
  print("Iremos criar uma conta para voce. Digite seu nome: ");
  final String? userName = stdin.readLineSync();

  print("Entre com uma senha de 8 digitos: ");
  final String? password = stdin.readLineSync();

  if (userName != null && password != null && UserModel.isValidPassword(password)){
    return UserModel(userName, password);
  } else {
    return null;
  }

}

BankAcctountType? getBankAccountType(){
  print("Digite 1 para criar uma conta poupança e digite 2 para  ");
  final String? bankType = stdin.readLineSync();

  switch (bankType) {
    case "1":
      return BankAcctountType.savings;

    case "2":
      return BankAcctountType.current;

    default:
      return null;
  }
  
}

BankAcctountModel? createBankAccount(){
  UserModel? user = createUser();

  if (user == null){
    print("Usuário ou senha inválida!");
    return null; 
  }

  BankAcctountType? bankAccountType = getBankAccountType();

  if (bankAccountType == null) {
    print("Tipo de conta selecionado é inválido!");
    return null; 
  }
  return BankAcctountModel(user, bankAccountType, 0.0);
}

String? getUserPassword(){
  print("Digite sua senha: ");
  return stdin.readLineSync();
}

String getUserName(){
  print("Entre com o nome do desntinatário da transferencia: ");
  return stdin.readLineSync() ?? "";
}

double getValue(){
  print("Entre com o valor: ");
  String? value = stdin.readLineSync();
  return double.parse(value ?? "0");
}

int getDeadline(){
  print("Entre com o prazo: ");
  String? value = stdin.readLineSync();
  return int.parse(value ?? "0");
}

void main(List<String> arguments) {
  BankAcctountModel? bankAccount = createBankAccount();

  if (bankAccount == null){
    print("Conta não criada!");
    return; 
  } else {
    bankAccount.getBankAccountInformations(getUserPassword() ?? "");
  }

  do {
    print("");
    print("Digite 0 - Para sair");
    print("Digite 1 - Para depositar um valor");
    print("Digite 2 - Para sacar um valor");
    print("Digite 3 - Para exibir o saldo e os dados da sua conta.");
    print("Digite 4 - Para ver o extrato, contendo o histórico de transações.");
    print("Digite 5 - ${bankAccount.type == BankAcctountType.savings ? "Para ver a prévia de rendimento" : "Para realizar uma transferencia"}");
    print("");

    final String? option = stdin.readLineSync();

    switch (option){
      case "0":
        return;

      case "1":
        bankAccount.deposit(
          getValue(), 
          getUserPassword() ?? "");

      case "2":
        bankAccount.withdraw(
          getValue(),
          getUserPassword() ?? "");

      case "3":
        bankAccount.getBankAccountInformations(getUserPassword() ?? "");

      case "4":
        bankAccount.getHistory(getUserPassword() ?? "");

      case "5":
        if (bankAccount.type == BankAcctountType.savings) {
           bankAccount.incomePreview(
            getDeadline(), 
            getUserPassword() ?? "");
        } else {
          bankAccount.makeNewTransferFor(
            getUserName(), 
            getValue(), 
            getUserPassword() ?? "");
        }

      default:
        print("Opção inválida. O programa será encerrado.");
        return;
    }

  } while (true);
 
}
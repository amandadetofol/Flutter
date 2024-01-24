import 'controllers/bank_controller.dart';
import 'models/account.dart';
import 'exception/bank_controller_exceptions.dart';
import 'dart:math';

void main() {
testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(
            name: "Ricarth Lima",
             balance: 400, 
             isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(
            name: "Caio Couto",
            balance: 600,
             isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
          idSender: "Kako", 
          idReceiver: "Ricarth", 
          amount: 10);

    if(result) {
      print("Operção concluída com sucesso!");
    } else {
      print("Ocorreu um erro inesperado!");
    }
  
  } on InvalidSenderAccountIdException catch (error) {
    print(error);
  } on InvalidReceiverAccountIdException catch (error) {
    print(error);
  } on InvalidSenderAmountException catch (error) {
    print(error);
  } on NotAuthenticatedException catch (error) {
    print(error);
  } catch (notMappedError) {
    print(notMappedError.toString());
  }

}


void testingNullSafety(){
  Account? account; 

  //simulando uma comunicacao externa 
  Random rng = Random();
  int randomNumber = rng.nextInt(10);

  if(randomNumber <= 5){
    account = Account(
             name: "Ricarth Lima",
             balance: 400, 
             isAuthenticated: true);
  }

  print(account.runtimeType);
  print(account?.balance ?? 0);
}
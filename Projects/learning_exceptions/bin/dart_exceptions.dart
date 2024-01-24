import 'controllers/bank_controller.dart';
import 'models/account.dart';
import 'exception/bank_controller_exceptions.dart';

void main() {
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
          idSender: "Kdako", 
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
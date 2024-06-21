import 'controllers/bank_controller.dart';
import 'models/account.dart';

void main(){
  //Criando objeto banco
  BankController bankController = BankController();
  //Criando contas
  bankController.addAccount(id: "1", account: Account(name: "Leonardo Casagrande", balance: 400, isAuthenticated: true));
  bankController.addAccount(id: "2", account: Account(name: "Arthur Leite", balance: 300, isAuthenticated: true));

  bool result = bankController.makeTransfer(idSender: "1", idReceiver: "2", amount: 100);

  print(result);

}

import '../models/account.dart';

class BankController{
  final Map<String, Account> _database = {};

  addAccount({required String id, required Account account}){
    _database[id] = account;
  }

  bool makeTransfer({required String idSender, required String idReceiver, required double amount}){
    //Verifica id do remetente
    if(!verifyId(idSender)){
      return false;
    }
    //Verifica id do destinatario
    if(!verifyId(idReceiver)){
      return false;
    }
    //Criando objetos
    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    //Verifica saldo remetente
    if(accountSender.balance < amount){
      return false;
    }
    //Verifica se remetente esta autenticado
    if(!accountSender.isAuthenticated){
      return false;
    }

    //Faz a tranferencia e altera valor das contas
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  bool verifyId(String id){
    return _database.containsKey(id);
  }

}
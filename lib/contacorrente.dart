import 'package:alurabank/cliente.dart';

class ContaCorrente {
  
  ContaCorrente(int novaAgencia, this.conta, this.titular){
    if(novaAgencia>0) _agencia = novaAgencia;
    totalDeContasCorrentes++;
  }

  static int totalDeContasCorrentes = 0;

  Cliente titular;
  int _agencia = 123;
  int get agencia => _agencia;
  set agencia(int novaAgencia) {if (novaAgencia > 0) _agencia = novaAgencia;}

  int conta = 1;
  double _saldo = 20.0;
  double chequeEspecial = -100.0;
  
  double get saldo {
    return _saldo;
  }

  set saldo(double novoSaldo) {
    if(novoSaldo >= chequeEspecial) {
      _saldo = novoSaldo;
    } else {
      print("Erro! Tentei modificar o valor de saldo para um valor menor que o cheque");
    }
  }

  bool verificaSaldo(double valor) {
    if (this._saldo - valor < chequeEspecial) {
      print("Sem saldo suficiente");
      return false;
    } else {
      print("Movimentando $valor reais");
      return true;
    }
  }

  bool transferencia(double valorDeTransferencia, ContaCorrente contaDestino) {
    if (!verificaSaldo(valorDeTransferencia)) {
      return false;
    } else {
      this._saldo -= valorDeTransferencia;
      contaDestino.deposito(valorDeTransferencia);
      return true;
    }
  }

  bool saque(double valorDoSaque) {
    if (!verificaSaldo(valorDoSaque)) {
      return false;
    } else {
      this._saldo -= valorDoSaque;
      return true;
    }
  }

  double deposito(double valorDoDeposito) {
    this._saldo += valorDoDeposito;
    return this._saldo;
  }
}

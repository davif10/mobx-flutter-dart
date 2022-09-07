import 'package:mobx/mobx.dart';
part 'controller.g.dart';
class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  ControllerBase() {
    //Executa sempre que o observável tem seu estado alterado
    autorun((_) {
      print("Email: $email");
      print("Senha: $senha");
    });
  }
  //Combinação de dois ou mais observáveis
  @computed
  String get emailSenha => "$email - $senha";

  @observable
  String email = '';

  @observable
  String senha = '';

  @action
  void setEmail(valor) => email = valor;

  @action
  void setSenha(valor) => senha = valor;

  @computed
  bool get formularioValidado => email.length >= 5 && senha.length >= 5;
  // @observable
  // int contador = 0;
  //
  // @action
  // incrementar(){
  //   contador++;
  // }
  // var _contador = Observable(0);
  // late Action incrementar;
  //
  // Controller(){
  //   incrementar = Action(_incrementar);
  // }
  // _incrementar(){
  //   contador++;
  // }
  //
  // int get contador => _contador.value;
  //
  // set contador(int novoValor) => _contador.value = novoValor;
}
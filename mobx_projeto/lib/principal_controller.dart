import 'package:mobx/mobx.dart';
part 'principal_controller.g.dart';
class PrincipalController = PrincipalControllerBase with _$PrincipalController;

abstract class PrincipalControllerBase with Store{
  @observable
  String novoItem = "";

  @action
  void setNovoItem(String valor) => novoItem = valor;

  ObservableList<String> listaItens = ObservableList();

  @action
  void adicionarItem(){
    listaItens.add(novoItem);
  }

}
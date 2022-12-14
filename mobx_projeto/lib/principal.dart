import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_projeto/principal_controller.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  PrincipalController _principalController = PrincipalController();

  _dialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Adicionar item"),
            content: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite uma descrição..."),
              onChanged: _principalController.setNovoItem,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    _principalController.adicionarItem();
                    Navigator.pop(context);
                  },
                  child: Text("Salvar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarefas",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Usuário: ${controller.email}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Flexible(
                  child: ListView.builder(
                    itemCount: _principalController.listaItens.length,
                    itemBuilder: (_, indice) {
                      var item = _principalController.listaItens[indice];
                      return Observer(builder: (_){
                        return ListTile(
                          title: Text(
                            item.titulo,
                            style: TextStyle(
                                decoration:
                                item.marcado ? TextDecoration.lineThrough : null),
                          ),
                          leading: Checkbox(
                            value: item.marcado,
                            onChanged: (value)=> item.alterarMarcado(value!),
                          ),
                          onTap: () {
                            item.marcado = !item.marcado;
                          },
                        );
                      });
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}

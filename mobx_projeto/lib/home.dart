import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_projeto/controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.all(16),
            //   child: Observer(
            //     builder: (_){
            //       return Text(
            //       "${controller.contador}",
            //       style: TextStyle(color: Colors.black, fontSize: 80),
            //       );
            //     },
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "E-mail"),
                onChanged: controller.setEmail,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
                onChanged: controller.setSenha,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_){
                  return Text(controller.formularioValidado
                      ? "Validado"
                  : "Campos não validados");
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Observer(
                  builder: (_){
                    return ElevatedButton(
                      onPressed:
                      controller.formularioValidado
                          ? () {}
                          : null,
                      child: Text(
                        "Logar",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

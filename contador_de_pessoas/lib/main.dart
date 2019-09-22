import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String _mudaTexto = "Pode Entrar!!!";

  void mudaPessoas(int delta) {
    setState(() {
      _pessoas += delta;

      if(_pessoas>10){
        _mudaTexto = "Restaurante Lotado";
      }
      else if(_pessoas<=0){
        _mudaTexto = "Restaurante vazio";
      }
      else{
        _mudaTexto = "Restaurante movimentado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "imagens/painel2.jpg",
          fit: BoxFit.cover,
          height: 800.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_pessoas",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  fontFamily: "Monospaced"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      mudaPessoas(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      mudaPessoas(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _mudaTexto,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: "Monospaced"),
            ),
          ],
        )
      ],
    );
  }
}

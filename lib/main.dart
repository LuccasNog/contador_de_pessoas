import 'package:flutter/material.dart';

void main() {
  /* Rodando o projeto*/
  runApp(MaterialApp(
      title: "Contador de pessoas",
      /* widgem na coluna*/
      home: Home()));
}


// Criando Widget STFULL

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Quantidade de pessoas vamos passar para o texto.
  int _people = 0;
  String _infoText = "Pode entrar";

  // Função que vai receber mais 1 qyabdi for pra incrementar

  void _changePeople(int delta){
    // executar o código e mandar atualizar a tela
    setState(() {
      //somar 1 ou subtrair um
      _people += delta;
      if(_people < 0){
         _infoText =  "Liberado";
      }else if(_people <= 10){
        _infoText =  "Pode entrar";
      }
      else{
        _infoText =  "Lotado";
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        Image.asset(
          "imagens/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),

        Column(

          /* Alinhando a coluna */
          mainAxisAlignment: MainAxisAlignment.center,
          /* Adicionado os widget = componentes */
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),


            Row(
              /* alinhando no eixo horizontal */
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:    /* Criando o button*/
                  FlatButton(
                    child: Text("+ 1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),

                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:    /* Criando o button*/
                  FlatButton(
                    child: Text("-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),

                ),

              ],
            ),


            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}




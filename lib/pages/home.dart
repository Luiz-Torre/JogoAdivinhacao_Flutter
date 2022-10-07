import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  String _imageatual = "default.png";
  String mensagemVencedor = "";
  String image = "images/";
  List<String> listaImagem = [
    "pedra.png",
    "papel.png",
    "tesoura.png",
  ];
  void _verJogada(String variavel){
    int randomIndex = Random().nextInt(listaImagem.length);
    String mensagem = "";

    if(variavel == listaImagem[randomIndex]){
      mensagem = "Empate";
    }
    if(variavel == "pedra.png" && listaImagem[randomIndex] == "tesoura.png"){
          mensagem = "Você ganhou!";
    }
    if(variavel == "pedra.png" && listaImagem[randomIndex] == "papel.png"){
          mensagem = "Você perdeu!";
    }
    if(variavel == "tesoura.png" && listaImagem[randomIndex] == "papel.png"){
          mensagem = "Você ganhou!";
    }
    if(variavel == "tesoura.png" && listaImagem[randomIndex] == "pedra.png"){
          mensagem = "Você perdeu!";
    }
    if(variavel == "papel.png" && listaImagem[randomIndex] == "pedra.png"){
          mensagem = "Você ganhou!";
    }
    if(variavel == "papel.png" && listaImagem[randomIndex] == "tesoura.png"){
          mensagem = "Você perdeu!";
    }
    setState((){

      this._imageatual = listaImagem[randomIndex];
      this.mensagemVencedor = mensagem;
    }
    
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo de Adivinhacao"),
        backgroundColor: Colors.blue,),
        body: Center(child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top:40,bottom: 30), child: Text("Escolha do APP", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
             
              Image.asset(image + _imageatual, width: 350),
              Padding(padding: EdgeInsets.only(top:40,bottom: 30), child: Text("Escolha sua jogada", style: TextStyle(fontSize: 24),)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  OutlinedButton(
                    child: Image.asset(image + "pedra.png",width: 150),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.transparent,
                        ),
                    ),
                    onPressed: () => _verJogada("pedra.png"),
                  ),
                  OutlinedButton(
                    child: Image.asset(image + "papel.png",width: 150),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.transparent,
                        ),
                    ),
                    onPressed: () => _verJogada("papel.png"),
                  ),
                  OutlinedButton(
                    child: Image.asset(image + "tesoura.png",width: 150),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.transparent,
                        ),
                    ),
                    onPressed: () => _verJogada("tesoura.png"),
                  ),
                ]
              ),
              Padding(padding: EdgeInsets.only(top:40,bottom: 30), child: Text(mensagemVencedor, style: TextStyle(fontSize: 24),)),




            ],
        ),
        ),
        ),     
    );
  }
}




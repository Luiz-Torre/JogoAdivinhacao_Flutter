import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}
enum Tentativa {
  facil(20),
  medio(15),
  dificil(6);

  const Tentativa(this.value);
  final num value;
}

class _MyWidgetState extends State<Home> {
  String mensagem = "";
  int vida = 0;
  Tentativa? _numero;
  int aleatorio = -10;
  int pontos = 1000;
  

  void _gerarRandom(){
    Random random = new Random();
    int randomNumber = random.nextInt(101);
    setState((){
        this.aleatorio = randomNumber;

    }
    
    );

  }


  void _comparaValores(int value){
    String msg_tmp = "";
    int pontos_perdidos = (((value - this.aleatorio).abs())/2.0).floor();
    if(this.aleatorio < 0){
      msg_tmp = "Escolha a dificuldade primeiro!";

    }
    else if(value == this.aleatorio){
      msg_tmp = "Você adivinhou. Parabéns!\nSeus pontos foram: $pontos\nEscolha a nova dificuldade para continuar jogando!";
    }
    else if(value < this.aleatorio){
      msg_tmp = "O valor buscado é maior do que você digitou";
    
    }
    else if(value > this.aleatorio){
      msg_tmp = "O valor buscado é menor do que você digitou";
    }
    setState((){
        this.mensagem = msg_tmp;
        if(msg_tmp == "O valor buscado é maior do que você digitou" ||  msg_tmp  =="O valor buscado é menor do que você digitou"){
          this.vida = vida - 1;
          this.pontos = this.pontos - pontos_perdidos;
        }
        if(this.vida <=0 && msg_tmp != "Escolha a dificuldade primeiro!"){
          this.mensagem = "Acabaram suas tentativas. Você perdeu!\nEscolha a nova dificuldade";
          this.aleatorio = -10;
          this._numero = null;
        }
        if(msg_tmp == "Você adivinhou. Parabéns!\nSeus pontos foram: $pontos\nEscolha a nova dificuldade para continuar jogando!"){
          this.aleatorio = -10;
          this._numero = null;
        }
    });

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
              Padding(padding: EdgeInsets.only(top:40,bottom: 30), child: Text('Selecione o nivel da dificuldade.', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
              RadioListTile<Tentativa>(
                title: const Text('Fácil'),
                value: Tentativa.facil,
                groupValue: _numero,
                onChanged: (Tentativa? value) {
                  setState(() {
                    _numero = value;
                    vida = 20;
                    _gerarRandom();

                  });
                },
              ),
              RadioListTile<Tentativa>(
                title: const Text('Médio'),
                value: Tentativa.medio,
                groupValue: _numero,
                onChanged: (Tentativa? value) {
                  setState(() {
                    _numero = value;
                    vida = 15;
                    _gerarRandom();

                  });
                },
              ),              
              RadioListTile<Tentativa>(
                title: const Text('Difícil'),
                value: Tentativa.dificil,
                groupValue: _numero,
                onChanged: (Tentativa? value) {
                  setState(() {
                    _numero = value;
                    vida = 6;
                    _gerarRandom();
                  });
                },
              ),             
              Padding(padding: EdgeInsets.only(top:40,bottom: 30), child: Text('Número de Tentativas: $vida', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
             
            SizedBox(
              width: 500,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Digite o número desejado',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (String value){
                  setState((){
                      _comparaValores(int.parse(value));

                    });

                } 
              ),
            ),
              Padding(padding: EdgeInsets.only(top:40,bottom: 30), child: Text(mensagem, style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),

        


            ],
        ),
        ),
        ),     
    );
  }
}




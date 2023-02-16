import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
    var _perguntasSelecionada = 0;
    var _pontuacaoTotal = 0;
    final _perguntas = const [
        {
          'texto': '1- Qual é a sua cor favorita?',
          'respostas': [
            { 'texto':  'Preto',  'pontuacao': 10},
            { 'texto':  'Vermelho', 'pontuacao': 1},
            { 'texto':  'Verde',   'pontuacao': 5},
            { 'texto':  'Branco',  'pontuacao': 3},
          ],
        },
        {
          'texto': '2- Qual é o seu animal favorita?',
          'respostas': [
          { 'texto':  'Cobra',    'pontuacao': 10 },
          { 'texto':  'Coelho',   'pontuacao': 1 },
          { 'texto':  'Elefante', 'pontuacao': 5 },
          { 'texto':  'Leão',     'pontuacao': 3 },
          ],
        },
        {
          'texto': '3- Qual é o seu instrutor favorito?',
          'respostas': [
           {'texto': 'Maria', 'pontuacao': 10},
           {'texto': 'João',  'pontuacao': 1 },
           {'texto': 'Leo',   'pontuacao': 5 },
           {'texto': 'Pedro', 'pontuacao': 3 },
          ],
        },
     ];

    void _responder(int pontuacao){
      if(temPerguntaSelecionada) {
        setState(() {
          _perguntasSelecionada++;
          _pontuacaoTotal += pontuacao;
        });
      }
    }

    void _reiniciarQuestionario() {
      setState(() {
        _perguntasSelecionada = 0;
        _pontuacaoTotal = 0;
      });
    }

    bool get temPerguntaSelecionada {
      return _perguntasSelecionada < _perguntas.length;
    }

    @override
    Widget build(BuildContext context){
      
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Questionario(
          perguntas: _perguntas,
          perguntasSelecionada: _perguntasSelecionada,
          quantoresponder: _responder,
        ) : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{

  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }
}
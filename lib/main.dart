import 'package:flutter/material.dart';
import 'package:lista_cursos/screens/cartoes_detalhes_screen.dart';
import 'package:lista_cursos/screens/cartoes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Cursos App',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CartoesScreen(),
        '/cartoes_detalhes': (context) => CartoesDetalhesScreen(),
      },
    );
  }
}

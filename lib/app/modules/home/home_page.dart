import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dio/app/modules/home/all_cards_page.dart';
import 'package:pokemon_dio/app/modules/home/detail_page.dart';
import 'package:pokemon_dio/app/modules/home/domain/pokemon.dart';
import 'package:pokemon_dio/app/modules/home/my_cards_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  int _currentIndex = 0;

  List<Widget> paginas = [
    AllCardsPage(),
    Container(),
    MyCardsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => trocarPagina(index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.all_inclusive), title: Text("cads")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("favoritos")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("obtidos")),
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: paginas,
        ));
  }

  trocarPagina(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

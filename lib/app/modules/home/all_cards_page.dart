import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dio/app/modules/home/detail_page.dart';
import 'package:pokemon_dio/app/modules/home/domain/pokemon.dart';
import 'package:pokemon_dio/app/modules/home/pokemon_repository.dart';
import 'home_controller.dart';
import 'home_module.dart';

class AllCardsPage extends StatefulWidget {
  @override
  _AllCardsPageState createState() => _AllCardsPageState();
}

class _AllCardsPageState extends ModularState<AllCardsPage, HomeController> {
  //use 'controller' variable to access controller

  List<Pokemon> pokemons = [];

  @override
  void initState() {
    loadPokemons();
    super.initState();
  }
  void loadPokemons() async {
    var allPokemons = await controller.getAllPokemons();
    setState(() {
      pokemons = allPokemons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      childAspectRatio: 0.72,
      crossAxisCount: 2,
      children: List.generate(pokemons.length, (index) {
        var pokemon = pokemons[index];
        return GestureDetector(
          onTap: () => abrirTelaDetalhar(pokemon),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Hero(
              tag: pokemon.uniqueId,
              child: Image.network(pokemon.imageUrl),
            ),
          ),
        );
      }),
    ));
  }

  abrirTelaDetalhar(Pokemon pokemon) {
    Navigator.of(context).push(
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      return PageDetail(pokemon: pokemon);
    }));
  }
}


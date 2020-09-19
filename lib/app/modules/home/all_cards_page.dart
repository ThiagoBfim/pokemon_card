import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dio/app/modules/home/detail_page.dart';
import 'package:pokemon_dio/app/modules/home/domain/pokemon.dart';
import 'home_controller.dart';

class AllCardsPage extends StatefulWidget {
  @override
  _AllCardsPageState createState() => _AllCardsPageState();
}

class _AllCardsPageState extends ModularState<AllCardsPage, HomeController> {
  //use 'controller' variable to access controller

  final List<Pokemon> pokemons = [
    Pokemon(
        id: 'xy7-10',
        types: ["Lightning"],
        imageUrl: "https://images.pokemontcg.io/ex16/16.png",
        imageUrlHiRes: "https://images.pokemontcg.io/ex16/16_hires.png",
        name: "Magneton"),
    Pokemon(
      id: 'pl2-103',
      types: ["Psychic"],
      imageUrl: "https://images.pokemontcg.io/pl2/103.png",
      name: "Alakazam",
      imageUrlHiRes: "https://images.pokemontcg.io/pl2/103_hires.png",
    ),
    Pokemon(
        id: 'ex8-100',
        types: ["Fighting"],
        imageUrl: "https://images.pokemontcg.io/ex8/100.png",
        imageUrlHiRes: "https://images.pokemontcg.io/ex8/100_hires.png",
        name: "Hariyama")
  ];

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
              tag: pokemon.id,
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


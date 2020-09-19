import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dio/app/modules/home/domain/pokemon.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
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

class PageDetail extends StatefulWidget {
  final Pokemon pokemon;

  const PageDetail({Key key, this.pokemon}) : super(key: key);

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  bool exibirCardExpadindo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => alterarExibicaoCard(),
              child: Visibility(
                visible: !exibirCardExpadindo,
                child: Hero(
                  tag: widget.pokemon.id,
                  child: Image.network(widget.pokemon.imageUrl),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => alterarExibicaoCard(),
              child: Visibility(
                visible: exibirCardExpadindo,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Image.network(widget.pokemon.imageUrlHiRes),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  alterarExibicaoCard() {
    setState(() {
      exibirCardExpadindo = !exibirCardExpadindo;
    });
  }
}

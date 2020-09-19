import 'package:flutter/material.dart';
import 'package:pokemon_dio/app/modules/home/domain/pokemon.dart';
import 'package:pokemon_dio/app/modules/home/pokemon_repository.dart';

import 'home_controller.dart';
import 'home_module.dart';

class PageDetail extends StatefulWidget {
  final Pokemon pokemon;

  const PageDetail({Key key, this.pokemon}) : super(key: key);

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  bool exibirCardExpadindo = false;

  final HomeController controller = HomeModule.to.get<HomeController>();

  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () => adicionarListaObtidos(),
          ),
        ],
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
                  tag: widget.pokemon.uniqueId,
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

  adicionarListaObtidos() {
    controller.adicionarListaObtidos(widget.pokemon);
    _key.currentState.showSnackBar(SnackBar(
      content: Text("Adiciona na lista de obtidos."),
    ));
  }
}

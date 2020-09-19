import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:pokemon_dio/app/modules/home/domain/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pokemon_repository.g.dart';

@Injectable()
class PokemonRepository extends Disposable {
  static const OBTIDOS_KEY = "OBTIDOS_KEY";
  final DioForNative client;

  PokemonRepository(this.client);

  @override
  void dispose() {
    //dispose will be called automatically
  }

  adicionarListaObtidos(Pokemon pokemon) async {
    var shared = await SharedPreferences.getInstance();
    var pokemons = shared.getStringList(OBTIDOS_KEY);

    if (pokemons == null || pokemons.isEmpty) {
      shared.setStringList(OBTIDOS_KEY, [pokemon.toJson()]);
    } else {
      pokemons.add(pokemon.toJson());
      shared.setStringList(OBTIDOS_KEY, pokemons);
    }
  }

  Future<List<Pokemon>> getPokemonsObtidos() async{
    var shared = await SharedPreferences.getInstance();
    var pokemons = shared.getStringList(OBTIDOS_KEY);
    if (pokemons == null){
      return [];
    }
    return pokemons.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
  }

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }
}

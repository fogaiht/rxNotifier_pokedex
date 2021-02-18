import 'package:poke_api/app/shared/models/pokemon_model.dart';
import 'package:poke_api/app/shared/models/user_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeRxStore {
  final _user = RxNotifier<UserModel>(UserModel());
  UserModel get user => _user.value;
  setUser(UserModel value) => _user.value = value;

  final _screenIndex = RxNotifier<int>(-1);
  int get screenIndex => _screenIndex.value;
  setScreenIndex(int value) => _screenIndex.value = value;

  final _currentURL = RxNotifier<String>("");
  String get currentURL => _currentURL.value;
  setCurrentURL(String value) => _currentURL.value = value;

  final _selectedPokemon = RxNotifier<PokemonModel>(null);
  PokemonModel get selectedPokemon => _selectedPokemon.value;
  setSelectedPokemon(PokemonModel value) {
    _selectedPokemon.value = value;
    setCurrentURL(value?.sprites?.frontDefault);
    if (screenIndex + 1 != user.pokemonList.length) {}
  }
}

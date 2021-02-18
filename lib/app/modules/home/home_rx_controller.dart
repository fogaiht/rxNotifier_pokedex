import 'package:bot_toast/bot_toast.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'home_repository.dart';
import 'home_rx_store.dart';

class HomeRxController {
  final HomeRepository _homeRepository;
  final HomeRxStore store;

  HomeRxController(this._homeRepository, this.store);

  getUser() async {
    try {
      var userModelResponse = _homeRepository.getCurrentUser().asRx();
      await userModelResponse;
      store.setUser(userModelResponse.data);
      print(store.user);
    } catch (e) {
      print(e);
    }
  }

  addPokemon(String pokeNumber) async {
    final cancel = BotToast.showLoading();
    try {
      var response = await _homeRepository.addPokemon(pokeNumber);
      await Future.delayed(Duration(milliseconds: 1000)); //um tempo de delay para aparecer o loading
      if (response != null) {
        getUser();
        store.setScreenIndex(-1);
        cancel();
      }
    } catch (e) {
      cancel();
      print(e);
    }
  }

  void increment() {
    if (store.screenIndex <= store.user.pokemonList.length) {
      if (store.screenIndex + 1 != store.user.pokemonList.length) {
        store.setCurrentURL(store.user.pokemonList[store.screenIndex + 1]?.sprites?.frontDefault);
        store.setScreenIndex(store.screenIndex + 1);
      }
    }
  }

  void decrement() {
    if (store.screenIndex >= 0 && store.user.pokemonList.length > 0) {
      store.setScreenIndex(store.screenIndex - 1);
      if (store.screenIndex + 1 != store.user.pokemonList.length) {
        if (store.screenIndex >= 0) {
          store.setCurrentURL(store.user.pokemonList[store.screenIndex]?.sprites?.frontDefault);
        }
      }
    }
  }
}

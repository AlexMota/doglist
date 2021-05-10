import 'package:doglist/app/modules/home/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository _repository = Modular.get();

  @observable
  int counter = 0;

  @observable
  List breeds = [];

  HomeStoreBase() {
    _init();
  }

  @action
  Future<void> _init() async {
    refresh();
  }

  Future<void> increment() async {
    counter = counter + 1;
  }

  Future<void> refresh() async {
    breeds = await this._repository.getAllBreeds();
  }
}

import 'package:doglist/app/modules/detail/detail_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'detail_store.g.dart';

class DetailStore = _DetailStoreBase with _$DetailStore;

abstract class _DetailStoreBase with Store {
  final DetailRepository _repository = Modular.get();

  @observable
  int counter = 0;

  @observable
  bool isLoading = false;

  @observable
  List images = [];

  List allImages = [];

  @action
  Future<void> refresh(String breed) async {
    allImages = await _repository.getImagesOfBreed(breed);
    loadPage(10);
  }

  Future<void> loadPage(int page) async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 1));
    this.counter += page;
    images = allImages.sublist(
        0, counter > allImages.length ? allImages.length : counter);
    isLoading = false;
  }
}

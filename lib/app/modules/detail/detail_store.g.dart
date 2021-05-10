// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailStore on _DetailStoreBase, Store {
  final _$counterAtom = Atom(name: '_DetailStoreBase.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_DetailStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$imagesAtom = Atom(name: '_DetailStoreBase.images');

  @override
  List<dynamic> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<dynamic> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$refreshAsyncAction = AsyncAction('_DetailStoreBase.refresh');

  @override
  Future<void> refresh(String breed) {
    return _$refreshAsyncAction.run(() => super.refresh(breed));
  }

  @override
  String toString() {
    return '''
counter: ${counter},
isLoading: ${isLoading},
images: ${images}
    ''';
  }
}

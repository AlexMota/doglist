import 'package:flutter_modular/flutter_modular.dart';
import 'detail_page.dart';
import 'detail_repository.dart';
import 'detail_store.dart';

class DetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailRepository()),
    Bind.lazySingleton((i) => DetailStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:breed',
        child: (_, args) => DetailPage(
              title: args.params['breed'],
            )),
  ];
}

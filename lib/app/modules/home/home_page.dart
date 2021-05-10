import 'package:doglist/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Breeds'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: store.breeds.length,
          itemBuilder: (context, index) {
            dynamic item = store.breeds[index];
            return ListTile(
              title: Text(item['name']),
              onTap: (){
                Modular.to.pushNamed('/detail/${item['name']}');
              },
            );
          },
        ),
      ),
    );
  }
}

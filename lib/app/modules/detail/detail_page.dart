import 'package:doglist/app/modules/detail/detail_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailPage extends StatefulWidget {
  final String title;

  const DetailPage({Key key, this.title = 'DetailPage'}) : super(key: key);

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends ModularState<DetailPage, DetailStore> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController
      ..addListener(() async {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          print('... call more');
          store.loadPage(10);
        }
      });


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: store.images.length,
                itemBuilder: (context, index) {
                  String url = store.images[index];
                  return ListTile(
                    title: Image.network(url),
                  );
                },
              ),
            ),
            store.isLoading ? CircularProgressIndicator() : Container(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    store.refresh(widget.title);
    super.initState();
  }
}

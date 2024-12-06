import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_animation/products_grid.dart';

import './providers/products_provider.dart';
import './constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: const Text('Some text here '),
        backgroundColor: Colors.red[200],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultPadding)),
        elevation: 35,
      ),
      drawerScrimColor: Colors.blue[300],
      // appBar: AppBar(
      //   title: Text(''),
      // ),
      body: Center(
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            // color: Colors.cyan,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: _header(context),
                ),
                const Flexible(
                  flex: 13,
                  child: ProductsGrid(),
                ),
                Flexible(
                  flex: 3,
                  child: _cart(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    var products = Provider.of<Products>(context).products;
    var count = products.where((element) => element.watched).length;
    return Container(
      color: Colors.blue,
      child: Text('Number of watched $count'),
    );
  }

  Widget _cart(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_kripto_val/models/product.dart';
import 'package:flutter_kripto_val/widget/bottom_bar.dart';
import 'package:flutter_kripto_val/widget/catalog.dart';
import 'package:flutter_kripto_val/widget/item_card.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - -85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Container(
                child: ListTile(
                  title: Text ("Освежающие напитки", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Боьше чем 1000 видов напитков", style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                height: 290,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productData.items.length,
                    itemBuilder: (context, int index) => ChangeNotifierProvider.value(value: productData.items[index],
                    child: ItemCard(),
                    ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(10.0),
                  child: Text("Каталгог коктейей"),
              ),
              ...productData.items.map((value) {
                return CatalogListTile(imgUrl: value.imgUrl);
              }).toList()
            ],
        ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_kripto_val/models/Cart.dart';
import 'package:flutter_kripto_val/widget/cart_list_item.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Корзина"),
      ),
      body: cartData.cartItems.isEmpty
        ? Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(30.0),
        child: Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("Корзина пустая!"),
        ),
      )
      : Column(
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Стоимость: "+ cartData.totalAmount.toStringAsFixed(2),style: TextStyle(fontSize:20.0),
              ),
              MaterialButton(onPressed: (){
              cartData.clear();
              },
                color: Theme.of(context).primaryColor,
              child: Text('Купить'),
              ),
            ],
          ),
          Divider(),
          Expanded(child: CartItemList(cartData: cartData,)),
        ],
      ),
    );
  }
}

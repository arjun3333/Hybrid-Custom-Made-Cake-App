import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:order_page/delivery_screen.dart';
import 'package:order_page/entity/cart_entity.dart';
import 'package:order_page/entity/order_history_entity.dart';
import 'package:order_page/order_screen.dart';
import 'package:route_animation_helper/route_animation_helper.dart';
import 'addeditems.dart';
import 'package:flutter/material.dart';

import 'custom_alert_dialog.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  _BagScreenState createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  CartEntity cartEntity = CartEntity();
  final profileDocId = FirebaseAuth.instance.currentUser?.uid;
  bool isShowLoginMessage = false;
  String? carDocId;
  int counterId = 1;

  @override
  void initState() {
    _getCartItemData();
    super.initState();
  }

  _getCartItemData() async {
    try {
      print("======= user name ${FirebaseAuth.instance.currentUser}");
      if (profileDocId != null && profileDocId!.isNotEmpty) {
        cartEntity.carItemList = [];
        // get a reference to the desired document / perform a query.
        final profileRef = FirebaseFirestore.instance
            .collection("cart")
            .where("userid", isEqualTo: profileDocId);
        // get a SnapShot of the data.
        final snapshot = await profileRef.get();
        List<CartItem> list = [];
        if (snapshot.docs.isNotEmpty) {
          for (var element in snapshot.docs) {
            if (element.exists) {
              carDocId = element.id;
              if (element.data().containsKey('items')) {
                element['items'].forEach((item) {
                  var cartItem = CartItem(
                    quantity: item['quantity'],
                    productId: item['productid'],
                    price: item['price'],
                    cakeImage: item['cakeimage'],
                    cakeName: item['cakename'],
                    orderTime: Timestamp.now(),
                    orderId: counterId + 1,
                  );
                  counterId = counterId + 1;
                  list.add(cartItem);
                });
              }
            }
          }
        }
        setState(() {
          cartEntity.carItemList = list;
        });
      } else {
        setState(() {
          isShowLoginMessage = true;
        });
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isShowLoginMessage
        ? const Center(
      child: Text(
        "Please Sign In to the App",
        style: TextStyle(fontSize: 20),
      ),
    )
        : cartEntity.carItemList!.isEmpty
        ? Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "There is nothing in your bag. \nLet's add some items.",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    )
        : SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AddedItems(
            cartItemList: cartEntity.carItemList ?? [],
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  title: const Text(
                    'Sub-Total',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '${cartEntity.getSumByPrice()}\$',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('Delivery Fee'),
                  trailing: const Text('40\$'),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onTap: () {},
              title: const Text(
                'Total',
                style: TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                '${cartEntity.getSumByPrice() + 40}\$',
                style: TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Card(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onTap: () {
                _makeOrder();
              },
              title: const Center(
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _makeOrder() async {
    try {
      OrderHistoryEntity orderHistoryEntity = OrderHistoryEntity();
      orderHistoryEntity.carItemList = [];
      orderHistoryEntity.carItemList = cartEntity.carItemList;
      // get a reference to the desired document / perform a query.
      final profileRef = FirebaseFirestore.instance
          .collection("orderhistory")
          .where("userid", isEqualTo: FirebaseAuth.instance.currentUser?.uid);
      // get a SnapShot of the data.
      final data = <String, dynamic>{};
      final snapshot = await profileRef.get();
      if (snapshot.docs.isNotEmpty) {
        if (snapshot.docs[0].data().containsKey('orderlist')) {
          snapshot.docs[0]['orderlist'].forEach((item) {
            var cartItem = CartItem(
                quantity: item['quantity'],
                productId: item['productid'],
                price: item['price'],
                cakeImage: item['cakeimage'],
                cakeName: item['cakename'],
                orderTime: item['orderdate'],
                orderId: item['orderId']);
            cartEntity.carItemList?.add(cartItem);
          });
        }
        data["orderlist"] = _addItemList(orderHistoryEntity.carItemList ?? []);
        data["userid"] = FirebaseAuth.instance.currentUser?.uid;
        await FirebaseFirestore.instance
            .collection("orderhistory")
            .doc(snapshot.docs[0].id)
            .set(data, SetOptions(merge: true));
      } else {
        data["orderlist"] = _addItemList(orderHistoryEntity.carItemList ?? []);
        data["userid"] = FirebaseAuth.instance.currentUser?.uid;
        await FirebaseFirestore.instance.collection("orderhistory").add(data);
        await FirebaseFirestore.instance
            .collection("cart")
            .doc(carDocId)
            .delete();
      }
      cartEntity.carItemList = [];
      Navigator.of(context).pushReplacement(RouteAnimationHelper.createRoute(
          buildContext: context,
          destination: const DeliveryScreen(),
          animType: AnimType.slideStart));
    } on FirebaseAuthException catch (e) {
      print(e);
      _showLoginDialog(e.message ?? "Something went wrong");
    }
  }

  _addItemList(List<CartItem> carItemList) {
    List<Map<String, dynamic>> _carItemList = [];
    for (var element in carItemList) {
      final data = <String, dynamic>{};
      data["productid"] = element.productId;
      data["price"] = element.price;
      data["quantity"] = 1;
      data['cakeimage'] = element.cakeImage;
      data['cakename'] = element.cakeName;
      data['orderdate'] = element.orderTime;
      data["orderId"] = element.orderId;
      _carItemList.add(data);
    }
    return _carItemList;
  }

  _showLoginDialog(String message) {
    CustomAlertDialog(
      context: context,
      title: "MakeMyCake",
      message: message,
      okText: "Ok",
      onPressedOk: () {},
    ).show();
  }
}

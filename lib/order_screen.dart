import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_page/entity/cart_entity.dart';
import 'package:order_page/entity/order_history_entity.dart';
import 'package:order_page/order_history.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderHistoryEntity orderHistoryEntity = OrderHistoryEntity();
  final profileDocId = FirebaseAuth.instance.currentUser?.uid;
  bool isShowLoginMessage = false;

  @override
  void initState() {
    _getOrderHistoryData();
    super.initState();
  }

  _getOrderHistoryData() async {
    try {
      if (profileDocId != null && profileDocId!.isNotEmpty) {
        orderHistoryEntity.carItemList = [];
        // get a reference to the desired document / perform a query.
        final profileRef = FirebaseFirestore.instance
            .collection("orderhistory")
            .where("userid", isEqualTo: profileDocId);
        // get a SnapShot of the data.
        final snapshot = await profileRef.get();
        List<CartItem> list = [];
        if (snapshot.docs.isNotEmpty) {
          for (var element in snapshot.docs) {
            if (element.exists) {
              if (element.data().containsKey('orderlist')) {
                element['orderlist'].forEach((item) {
                  var cartItem = CartItem(
                    userName:
                    FirebaseAuth.instance.currentUser!.email!.split("@")[0],
                    orderId: item['orderId'],
                    quantity: item['quantity'],
                    productId: item['productid'],
                    price: item['price'],
                    cakeImage: item['cakeimage'],
                    cakeName: item['cakename'],
                    orderTime: item['orderdate'],
                  );
                  list.add(cartItem);
                });
              }
            }
          }
        }
        setState(() {
          orderHistoryEntity.carItemList = list;
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(118, 60, 0, 10),
          title: const Text(
            'Order History',
          ),
        ),
        body: isShowLoginMessage
            ? const Center(
          child: Text(
            "Please Sign In to the App",
            style: TextStyle(fontSize: 20),
          ),
        )
            : orderHistoryEntity.carItemList!.isEmpty
            ? Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Please make a order.",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        )
            : OrderHistory(
          orderHistoryList: orderHistoryEntity.carItemList ?? [],
        ),
      ),
    );
  }
}

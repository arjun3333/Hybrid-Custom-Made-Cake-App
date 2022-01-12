import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_page/entity/cart_entity.dart';
import 'package:order_page/entity/premade_response_entity.dart';

import 'custom_alert_dialog.dart';

class CakeDetailsScreen extends StatefulWidget {
  final PreMadeResponseEntity entity;

  const CakeDetailsScreen({Key? key, required this.entity}) : super(key: key);

  @override
  _CakeDetailsScreenState createState() => _CakeDetailsScreenState();
}

class _CakeDetailsScreenState extends State<CakeDetailsScreen> {
  CartEntity cartEntity = CartEntity();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            leading: Icon(Icons.home),
            title: Text("MakeMyCake"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(118, 60, 0, 10),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 260,
                  color: Colors.white,
                  child: Image.network(
                    widget.entity.cakeImage ?? "",
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Center(
                        child: Text(
                          widget.entity.name ?? "",
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: Text(
                          'Details:',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        widget.entity.description ?? "",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 15.0),
                          child: Text(
                            'Price: ${widget.entity.price}\$',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              _addToCart(cartEntity);
                            },
                            child: Text(
                              'ADD TO CART',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              fixedSize: Size.fromWidth(150),
                              primary: Colors.brown,
                              onSurface: Colors.red,
                              backgroundColor: Color(0xFFBCAAA4),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                _favouriteCake(widget.entity);
                              },
                              child: Text(
                                'ADD TO FAVORITE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromWidth(195),
                                primary: Colors.brown,
                                onSurface: Colors.red,
                                backgroundColor: Color(0xFFBCAAA4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _favouriteCake(PreMadeResponseEntity entity) async {
    try {
      entity.isFavourite = !entity.isFavourite!;
      print("===== fav ${entity.isFavourite}");
      if (!entity.isFavourite!) {
        entity.favouritesIds!.removeWhere(
                (element) => element == FirebaseAuth.instance.currentUser?.uid);
      } else {
        entity.favouritesIds ??= [];
        entity.favouritesIds!.add(FirebaseAuth.instance.currentUser?.uid);
      }
      final data = <String, dynamic>{};
      data["isfavourite"] = entity.isFavourite;
      data["favouriteids"] = entity.favouritesIds!;
      await FirebaseFirestore.instance
          .collection("premade")
          .doc(entity.docId)
          .set(data, SetOptions(merge: true));
      setState(() {});
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  _addToCart(CartEntity entity) async {
    try {
      cartEntity.carItemList = [];
      CartItem cartItem = CartItem(
        price: widget.entity.price ?? "",
        productId: widget.entity.docId ?? "",
        quantity: 1,
        cakeName: widget.entity.name ?? "",
        cakeImage: widget.entity.cakeImage ?? "",
      );
      cartEntity.carItemList?.insert(0, cartItem);
      // get a reference to the desired document / perform a query.
      final profileRef = FirebaseFirestore.instance
          .collection("cart")
          .where("userid", isEqualTo: FirebaseAuth.instance.currentUser?.uid);
      // get a SnapShot of the data.
      final data = <String, dynamic>{};
      final snapshot = await profileRef.get();
      if (snapshot.docs.isNotEmpty) {
        if (snapshot.docs[0].data().containsKey('items')) {
          snapshot.docs[0]['items'].forEach((item) {
            var cartItem = CartItem(
                quantity: item['quantity'],
                productId: item['productid'],
                price: item['price'],
                cakeImage: item['cakeimage'],
                cakeName: item['cakename']);
            cartEntity.carItemList?.add(cartItem);
          });
        }
        data["items"] = _addItemList(entity.carItemList ?? []);
        data["userid"] = FirebaseAuth.instance.currentUser?.uid;
        await FirebaseFirestore.instance
            .collection("cart")
            .doc(snapshot.docs[0].id)
            .set(data, SetOptions(merge: true));
        _showLoginDialog("Added item in cart");
      } else {
        data["items"] = _addItemList(entity.carItemList ?? []);
        data["userid"] = FirebaseAuth.instance.currentUser?.uid;
        await FirebaseFirestore.instance.collection("cart").add(data);
        _showLoginDialog("Added item in cart");
      }
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
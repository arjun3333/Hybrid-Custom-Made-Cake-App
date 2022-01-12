import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

class CartEntity {
  List<CartItem>? carItemList;

  CartEntity({
    this.carItemList,
  });

  int getSumByPrice() {
    List<int> sumList = [];
    if (carItemList != null && carItemList!.isNotEmpty) {
      for (var element in carItemList!) {
        sumList.add(int.parse(element.price));
      }
    }
    return sumList.sum;
  }
}

class CartItem {
  String? userName;
  int? orderId;
  int quantity;
  String productId;
  String price;
  String cakeImage;
  String cakeName;
  Timestamp? orderTime;

  CartItem({
    this.quantity = 1,
    this.productId = "",
    this.price = "",
    this.cakeImage = "",
    this.cakeName = "",
    this.userName="",
    this.orderId,
    this.orderTime,
  });
}

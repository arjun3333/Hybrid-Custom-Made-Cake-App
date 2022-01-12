import 'package:collection/collection.dart';
import 'package:order_page/entity/cart_entity.dart';

class OrderHistoryEntity {
  List<CartItem>? carItemList;

  OrderHistoryEntity({
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

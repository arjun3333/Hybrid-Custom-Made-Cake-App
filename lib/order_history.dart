import 'package:flutter/material.dart';
import 'package:order_page/entity/cart_entity.dart';
import 'package:intl/intl.dart';

class OrderHistory extends StatelessWidget {
  final List<CartItem> orderHistoryList;

  const OrderHistory({
    Key? key,
    required this.orderHistoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return orderHistoryList.isNotEmpty
        ? ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: orderHistoryList.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                shadowColor: Colors.black,
                color: Colors.white70,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        orderHistoryList[index].userName ?? "",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    Divider(
                      indent: 20.0,
                      thickness: 2.0,
                      endIndent: 20.0,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              'Order ID',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '${orderHistoryList[index].orderId}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Order Amount',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '${orderHistoryList[index].price }\$',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Order Date',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "${getFormattedDate(orderHistoryList[index].orderTime!.toDate()) ?? ""}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      indent: 20.0,
                      thickness: 2.0,
                      endIndent: 20.0,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          size: 35.0,
                        ),
                        Text(
                          'Apt No:101, 0000 Linton Avenue, Montreal, QC - A1Z2G3',
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ],
                    ),
                    Divider(
                      indent: 20.0,
                      thickness: 2.0,
                      endIndent: 20.0,
                      color: Colors.black,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 3.0, bottom: 10.0),
                      child: Text(
                        'Payment Type - Online',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        })
        : const Center(
      child: CircularProgressIndicator(),
    );
  }

  static getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }
}

import 'package:flutter/material.dart';

import 'entity/cart_entity.dart';

class AddedItems extends StatefulWidget {
  final List<CartItem> cartItemList;

  const AddedItems({
    Key? key,
    required this.cartItemList,
  }) : super(key: key);

  @override
  State<AddedItems> createState() => _AddedItemsState();
}

class _AddedItemsState extends State<AddedItems> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: widget.cartItemList.isNotEmpty
            ? ListView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.cartItemList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey),
                      child: Image.network(
                          widget.cartItemList[index].cakeImage),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            widget.cartItemList[index].cakeName,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          'Quantity: ${widget.cartItemList[index].quantity}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'Price: ${widget.cartItemList[index].price}\$',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 60.0,
                    ),
                  ],
                ),
              );
            })
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

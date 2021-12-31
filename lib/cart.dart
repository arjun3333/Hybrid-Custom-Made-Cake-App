
import 'addeditems.dart';
import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AddedItems(),
          Container(
            child: Card(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:Column(
                children: [
                  ListTile(
                    onTap: () {

                    },
                    title: Text(
                      'Sub-Total',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    trailing: Text(
                      '40\$',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {

                    },
                    title: Text(
                        'Delivery Fee'
                    ),
                    trailing: Text('40\$'),
                  ),

                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              onTap: () {

              },
              title: Text(
                'Total',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500
                ),
              ),
              trailing: Text(
                '40\$',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          Card(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              onTap: () {

              },
              title: Center(
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
}

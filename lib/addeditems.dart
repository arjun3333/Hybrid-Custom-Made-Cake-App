import 'package:flutter/material.dart';

class AddedItems extends StatelessWidget {
  const AddedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 150.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey
                      ),
                      child: Image.asset('images/cake1.jpg'),

                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0,left: 10.0,bottom: 10.0),
                          child: Text(
                            'Product Name',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Text(
                          'Price: 40\$',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 60.0,

                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0,bottom: 8.0),
                          child: Text(
                            'Quantity',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          '10',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
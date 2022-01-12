import 'dart:async';

import 'package:flutter/material.dart';
import 'package:order_page/order_screen.dart';
import 'package:route_animation_helper/route_animation_helper.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  static const TIMER_GAP_SECONDS =50;
  int counter = 1;
  Timer timer = Timer.periodic(const Duration(seconds: 0), (timer) {});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Delivery Screen"),
          backgroundColor: const Color.fromRGBO(118, 60, 0, 10),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "images/map.jpeg",
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: 200,
              child: Text(
                "Time For order delivery",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "${timer.tick} Seconds",
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  _startTimer() {
    if (timer.isActive) timer.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final ctr = counter + 1;
      print("==== timer ${timer.tick}");
      if (ctr > 0 && ctr < TIMER_GAP_SECONDS) {
        if (mounted) {
          setState(() {
            counter = ctr;
          });
        }
      } else {
        setState(() {
          counter = 0;
        });
        timer.cancel();
        Navigator.of(context).pushReplacement(RouteAnimationHelper.createRoute(
            buildContext: context,
            destination: const OrderScreen(),
            animType: AnimType.slideStart));
      }
    });
  }
}

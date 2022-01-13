import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_page/cake_details_screen.dart';
import 'package:order_page/entity/premade_response_entity.dart';
import 'package:route_animation_helper/route_animation_helper.dart';

import 'cake_screen_details.dart';
import 'custom_alert_dialog.dart';

class PreMade extends StatefulWidget {
  const PreMade({Key? key}) : super(key: key);

  @override
  _PreMadeState createState() => _PreMadeState();
}

class _PreMadeState extends State<PreMade> {
  // final List<String> entries = <String>['A', 'B', 'C'];
  // final List<int> colorCodes = <int>[600, 500, 100];
  List<PreMadeResponseEntity> entity = [];
  final _searchController = TextEditingController();
  final profileDocId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    _getPreMadeData();
    super.initState();
  }

  _getPreMadeData() async {
    try {
      entity = [];
      // get a reference to the desired document / perform a query.
      final profileRef = FirebaseFirestore.instance.collection("premade");
      // get a SnapShot of the data.
      final snapshot = await profileRef.get();
      List<PreMadeResponseEntity> list = [];
      if (snapshot.docs.isNotEmpty) {
        for (var element in snapshot.docs) {
          if (element.exists) {
            final data = element.data();
            var membershipEntity = PreMadeResponseEntity(
              docId: element.id,
              name: data['name'],
              description: data['description'],
              cakeImage: data['cakeimage'],
              duration: data['duration'],
              distance: data['distance'],
              isFavourite: data['isfavourite'],
              price: data['price'],
              favouritesIds: data['favouriteids'],
            );
            if (membershipEntity.favouritesIds != null &&
                membershipEntity.favouritesIds!.contains(profileDocId)) {
              membershipEntity.isFavourite = true;
            } else {
              membershipEntity.isFavourite = false;
            }
            list.add(membershipEntity);
          }
        }
      }
      setState(() {
        entity = list;
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: (value) {},
                  controller: _searchController,
                  decoration: const InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              entity.isNotEmpty
                  ? ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: entity.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (profileDocId != null) {
                        Navigator.of(context)
                            .push(RouteAnimationHelper.createRoute(
                            buildContext: context,
                            destination: CakeDetailsScreen(
                              entity: entity[index],
                            ),
                            animType: AnimType.slideStart));
                      } else {
                        _showLoginDialog();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      color: const Color.fromRGBO(118, 60, 0, 10),

                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(
                              entity[index].cakeImage ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entity[index].name ?? "",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    entity[index].description ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        splashRadius: 16,
                                        constraints: const BoxConstraints(
                                            maxHeight: 24),
                                        onPressed: () {
                                          if (profileDocId != null) {
                                            entity[index].isFavourite =
                                            !entity[index]
                                                .isFavourite!;
                                            _favouriteCake(entity[index]);
                                          } else {
                                            _showLoginDialog();
                                          }
                                        },
                                        icon: Icon(
                                          entity[index].isFavourite!
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      const Text("FAV"),
                                      const Icon(
                                        Icons.add_location_rounded,
                                        color: Colors.greenAccent,
                                      ),
                                      Text("${entity[index].distance}km"),
                                      const Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.orangeAccent,
                                      ),
                                      Text(
                                          "${entity[index].duration} mins"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
                  : const Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }

  _favouriteCake(PreMadeResponseEntity entity) async {
    try {
      if (!entity.isFavourite! && entity.favouritesIds!.isNotEmpty) {
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

  _showLoginDialog() {
    CustomAlertDialog(
      context: context,
      title: "MakeMyCake",
      message: "Please complete Login ",
      okText: "Ok",
      onPressedOk: () {},
    ).show();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:order_page/entity/premade_response_entity.dart';

class FavouritesCakeScreen extends StatefulWidget {
  const FavouritesCakeScreen({Key? key}) : super(key: key);

  @override
  _FavouritesCakeScreenState createState() => _FavouritesCakeScreenState();
}

class _FavouritesCakeScreenState extends State<FavouritesCakeScreen> {
  List<PreMadeResponseEntity> entity = [];
  final profileDocId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    _getPreMadeData();
    super.initState();
  }

  _getPreMadeData() async {
    try {
      print("=========== ${profileDocId}");
      entity = [];
      // get a reference to the desired document / perform a query.
      if (profileDocId != null) {
        final profileRef = FirebaseFirestore.instance
            .collection("premade")
            .where("favouriteids", arrayContains: profileDocId);
        // get a SnapShot of the data.
        final snapshot = await profileRef.get();
        List<PreMadeResponseEntity> list = [];
        if (snapshot.docs.isNotEmpty) {
          for (var element in snapshot.docs) {
            if (element.exists) {
              final data = element.data();
              print("==== ${data['isfavourite']}");
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
              list.add(membershipEntity);
            }
          }
        }
        setState(() {
          entity = list
              .where((e) => e.isFavourite != null && e.isFavourite!)
              .toList();
        });
      } else {}
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Favourite Cakes"),
          backgroundColor: const Color.fromRGBO(118, 60, 0, 10),
        ),
        body: profileDocId == null
            ? const Center(
          child: Text(
            "Please Sign In to the App",
            style: TextStyle(fontSize: 20),
          ),
        )
            : entity.isEmpty
            ? const Center(
          child: Text(
            "You do not have any Favorite Cakes",
            style: TextStyle(fontSize: 20),
          ),
        )
            : entity.isNotEmpty && profileDocId != null
            ? ListView.builder(
          physics: const ScrollPhysics(),
          itemCount: entity.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.grey,
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
                                constraints:
                                BoxConstraints(maxHeight: 24),
                                onPressed: () {
                                  entity[index].isFavourite =
                                  !entity[index].isFavourite!;
                                  _favouriteCake(entity[index]);
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
            );
          },
        )
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  _favouriteCake(PreMadeResponseEntity entity) async {
    try {
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
}

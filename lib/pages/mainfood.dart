import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class mainfood extends StatefulWidget {
  const mainfood({super.key});

  @override
  State<mainfood> createState() => _mainfoodState();
}

class _mainfoodState extends State<mainfood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Food"),
      ),
      body: ListView(
        children: [
          Text("รายการอาหาร"),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Foods").snapshots(),
            builder: (context, snapshots) {
              switch (snapshots.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  print(snapshots.data!.docs.length);
                  return ListView(
                    shrinkWrap: true,
                    children: makelistwidget(snapshots),
                  );
              }
            },
          )
        ],
      ),
    );
  }
}

List<Widget> makelistwidget(
    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshots) {
  return snapshots.data!.docs.map(
    (doc) {
      return ListTile(
        title: Text(doc['food_name']),
        subtitle: Text(doc['price'].toString()),
      );
    },
  ).toList();
}

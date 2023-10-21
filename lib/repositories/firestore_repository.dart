import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String> retrieveApiKey() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("apikey").doc('hcWC2pwTZ42cymz9YOsA').get(
              const GetOptions(source: Source.serverAndCache),
            );
    return snapshot.data()!["key"];
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  String? image;
  String? name;

  Movie({
    this.image,
    this.name,
  });

  factory Movie.fromFirestore(DocumentSnapshot snapshot) {
    Map d = snapshot.data() as Map<dynamic, dynamic>;
    return Movie(
      image: d['image'],
      name: d['name'],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Cast {
  String? image;
  String? name;
  String? movie;
  String? movieImage;

  Cast({this.image, this.name, this.movie, this.movieImage});

  factory Cast.fromFirestore(DocumentSnapshot snapshot) {
    Map d = snapshot.data() as Map<dynamic, dynamic>;
    return Cast(
      image: d['image'],
      name: d['name'],
      movie: d['movie'],
      movieImage: d['movieImage'],
    );
  }
}

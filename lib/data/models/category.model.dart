import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory CategoryModel.fromJson(DocumentSnapshot snapshot) => CategoryModel(
    id: snapshot.id,
    name: snapshot["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

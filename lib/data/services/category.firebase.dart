import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_list/data/models/category.model.dart';

class CategoryService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

// Get list
 Stream<List<CategoryModel>> getData() {
   return _db.collection('category_list').snapshots().map((snapshot) {
     return snapshot.docs.map((doc) {
       return CategoryModel.fromJson(doc);
     }).toList();
   });
 }
}
import 'package:flutter_firebase_list/data/models/category.model.dart';
import 'package:flutter_firebase_list/data/services/category.firebase.dart';

class CategoryRepository {
  final CategoryService _service = CategoryService();

  Stream<List<CategoryModel>> getData() {
    return _service.getData();
  }
}
